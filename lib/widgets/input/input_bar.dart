import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:async';
import 'emoticon_button.dart';
import 'markdown_button.dart';
import 'media_button.dart';
import 'send_button.dart';
import 'selected_image.dart';
import 'package:image_picker/image_picker.dart';

typedef void SuggestCallback(String q);

typedef Future InputBarCallback(InputData inputData);
typedef void OnImageStateChangedCallback(File image);

class InputBarWidget extends StatefulWidget {
  final InputBarCallback callback;
  final OnImageStateChangedCallback imageStateChanged;
  final TextEditingController externalController;
  final Color iconsColor;
  final String hintText;

  InputBarWidget(
    this.callback, {
    @required Key key,
    this.externalController,
    this.imageStateChanged,
    this.iconsColor,
    this.hintText = 'Treść komentarza',
  }) : super(key: key);

  InputBarWidgetState createState() => InputBarWidgetState();
}

class InputBarWidgetState extends State<InputBarWidget> {
  bool showMarkdownBar = false;
  bool showMediaButton = true;
  bool showTextFormatBar = false;
  bool clickTextField = false;
  bool isEmpty = true;
  bool sending = false;

  bool get hasExternalInput => widget.externalController != null;

  File image;

  @override
  void initState() {
    super.initState();
    if (widget.externalController != null) {
      this.textController = widget.externalController;
    }
    textController.addListener(() => _watchTextChanges());
  }

  final FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();

  void replyToUser(Author author) {
    _ensureFocus();
    setState(() {
      textController.text += "@" + author.login + ": ";
      textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length));
    });
  }

  void pickImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    setImage(image);
  }

  void _ensureFocus() {
    if (!focusNode.hasFocus) {
      FocusScope.of(context).requestFocus(focusNode);
    }
  }

  void quoteText(Author author, String body) {
    _ensureFocus();
    setState(() {
      textController.text += "@" + author.login + ": \n" + "> " + body + "\n";
      textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length));
    });
  }

  // Returns currently selected text or placeholder for markdown actions
  String getSelectedText() {
    if (textController.selection.start != textController.selection.end) {
      return textController.text.substring(
          textController.selection.start, textController.selection.end);
    } else {
      return "tekst";
    }
  }

  // Inserts given prefix and suffix to currently selected text
  void insertSelectedText(String prefix, {String suffix = ""}) {
    _ensureFocus();
    var initialSelectionStart = textController.selection.start;
    var text = getSelectedText();
    setState(() {
      textController.text =
          textController.text.substring(0, textController.selection.start) +
              prefix +
              text +
              suffix +
              textController.text.substring(
                  textController.selection.end, textController.text.length);
      textController.selection = TextSelection(
          baseOffset: initialSelectionStart + prefix.length,
          extentOffset: initialSelectionStart + text.length + prefix.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShadowControlModel>(
      builder: (context, shadowControlModel, _) => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(shadowControlModel.showInputShadow ? 0.1 : 0.0),
              blurRadius: shadowControlModel.showInputShadow ? 1.0 : 0.0,
            ),
          ],
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _drawSuggestions(),
            hasExternalInput ? Container() : _drawInputBar(),
            _drawButtons(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  _watchTextChanges() {
    if (textController.text != null && textController.text.length >= 3) {
      if (isEmpty) {
        setState(() {
          isEmpty = false;
        });
      }
    } else if (!isEmpty) {
      setState(() {
        isEmpty = true;
      });
    }
  }

  Widget _drawInputBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MarkdownButtonWidget(
            show: showMarkdownBar,
            onTap: () {
              setState(() {
                showMarkdownBar = showMarkdownBar ? false : true;
                showMediaButton =
                    showMarkdownBar ? false : clickTextField ? false : true;
              });
            },
            iconColor: widget.iconsColor,
          ),
          MediaButtonWidget(
            show: showMediaButton,
            onTap: () => this.pickImage(ImageSource.gallery),
            iconColor: widget.iconsColor,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 6.0,
                ),
                padding: EdgeInsets.only(
                  top: 1.0,
                  right: 1.0,
                  bottom: 1.0,
                ),
                decoration: BoxDecoration(
                  color: Utils.backgroundGreyOpacity(context),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SelectedImageWidget(
                        image: this.image,
                        onTap: () {
                          removeImage();
                        }),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 90.0,
                              ),
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  reverse: true,
                                  child: Consumer<SuggestionsModel>(
                                    builder: (context, suggestionsModel, _) =>
                                        TextField(
                                      focusNode: focusNode,
                                      cursorWidth: 1.5,
                                      cursorRadius: Radius.circular(20.0),
                                      onChanged: (text) {
                                        suggestionsModel.loadSuggestions(
                                            extractSuggestions());
                                      },
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .merge(
                                            TextStyle(fontSize: 16.0),
                                          ),
                                      maxLines: null,
                                      controller: this.textController,
                                      keyboardType: TextInputType.multiline,
                                      onTap: () {
                                        setState(() {
                                          showMediaButton = false;
                                          clickTextField = true;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        border: InputBorder.none,
                                        hintText: widget.hintText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          EmoticonButtonWidget(
                            onTap: () {},
                            iconColor: widget.iconsColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SendButtonWidget(
            onTap: () {
              this._sendButtonClicked(context);
            },
            isEmpty: isEmpty,
            sending: sending,
            iconColor: widget.iconsColor,
          ),
        ],
      ),
    );
  }

  void _insertSuggestion(String suggestion) {
    var initialSelectionStart = textController.selection.start;
    var allNodes = textController.text
        .substring(0, textController.selection.start)
        .split(suggestion[0]);
    var currentSuggestion = allNodes.last;
    var replacedWithSuggestion = textController.text.substring(
            0, textController.selection.start - currentSuggestion.length) +
        suggestion.substring(1) +
        ' ';

    setState(() {
      textController.text = replacedWithSuggestion +
          textController.text.substring(textController.selection.start);
      textController.selection = TextSelection.fromPosition(TextPosition(
          offset: initialSelectionStart -
              currentSuggestion.length +
              suggestion.length)); // quick maffs
    });
  }

  Widget _drawSuggestions() {
    return Consumer<SuggestionsModel>(
        builder: (context, suggestionModel, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List()
              ..addAll(suggestionModel.authorSuggestions
                  .sublist(
                      0,
                      suggestionModel.authorSuggestions.length < 5
                          ? suggestionModel.authorSuggestions.length
                          : 5)
                  .map((s) => new UserSuggestionWidget(
                        applySuggestion: () {
                          this._insertSuggestion('@' + s.login);
                          suggestionModel.clearSuggestions();
                        },
                        suggestion: s,
                      ))
                  .toList())
              ..addAll(suggestionModel.tagSuggestions
                  .sublist(
                      0,
                      suggestionModel.tagSuggestions.length < 5
                          ? suggestionModel.tagSuggestions.length
                          : 5)
                  .map((s) => new TagSuggestionWidget(
                        applySuggestion: () {
                          this._insertSuggestion(s.tag);
                          suggestionModel.clearSuggestions();
                        },
                        suggestion: s,
                      ))
                  .toList())));
  }

  Widget _drawButtons() {
    if (showMarkdownBar || hasExternalInput) {
      return Container(
        padding: EdgeInsets.only(
          bottom: 8.0,
          left: 6.0,
          right: 6.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: !showTextFormatBar
              ? <Widget>[
                  _drawIconRound(
                    icon: Icons.text_format,
                    color: Colors.deepOrange,
                    onTap: () {
                      setState(() {
                        showTextFormatBar = true;
                      });
                    },
                  ),
                  _drawIconRound(
                    icon: Icons.link,
                    color: Colors.indigo,
                    onTap: () =>
                        insertSelectedText("[", suffix: "](https://wykop.pl)"),
                  ),
                  _drawIconRound(
                    icon: Icons.visibility_off,
                    color: Colors.grey[600],
                    onTap: () => insertSelectedText("\n! ", suffix: "\n"),
                  ),
                  _drawIconRound(
                    icon: Icons.list,
                    color: Colors.deepPurple,
                    onTap: () => {},
                  ),
                  _drawIconRound(
                    icon: Icons.image,
                    color: Colors.green[600],
                    onTap: () => this.pickImage(ImageSource.gallery),
                  ),
                  _drawIconRound(
                    icon: Icons.camera_alt,
                    color: Colors.blueAccent,
                    onTap: () => this.pickImage(ImageSource.camera),
                  ),
                  _drawIconRound(
                    icon: Icons.fullscreen,
                    color: Colors.brown,
                    onTap: () {},
                  ),
                  Expanded(child: Container()),
                  hasExternalInput
                      ? SendButtonWidget(
                          onTap: () {
                            this._sendButtonClicked(context);
                          },
                          isEmpty: isEmpty,
                          sending: sending,
                        )
                      : Container(),
                ]
              : <Widget>[
                  _drawIconRound(
                    icon: Icons.arrow_back,
                    onTap: () {
                      setState(() {
                        showTextFormatBar = false;
                      });
                    },
                  ),
                  _drawIconRound(
                    icon: Icons.format_bold,
                    color: Colors.red,
                    onTap: () => insertSelectedText("**", suffix: "**"),
                  ),
                  _drawIconRound(
                    icon: Icons.format_italic,
                    color: Colors.indigo,
                    onTap: () => insertSelectedText("_", suffix: "_"),
                  ),
                  _drawIconRound(
                    icon: Icons.format_quote,
                    color: Colors.amber[600],
                    onTap: () => insertSelectedText("\n> ", suffix: "\n"),
                  ),
                  _drawIconRound(
                    icon: Icons.code,
                    color: Colors.purple,
                    onTap: () => insertSelectedText("`", suffix: "`"),
                  ),
                  Expanded(child: Container()),
                  hasExternalInput
                      ? SendButtonWidget(
                          onTap: () {
                            this._sendButtonClicked(context);
                          },
                          isEmpty: isEmpty,
                          sending: sending,
                        )
                      : Container(),
                ],
        ),
      );
    } else {
      return Container();
    }
  }

  void _sendButtonClicked(BuildContext context) async {
    setState(() {
      this.sending = true;
    });

    var inputModel = Provider.of<InputModel>(context, listen: false);
    await inputModel.onInputSubmitted(
        InputData(body: this.textController.text, file: this.image));
    setState(() {
      this.sending = false;
      this.textController.clear();
    });
    removeImage();
  }

  Widget _drawIconRound({IconData icon, Color color, VoidCallback onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100.0),
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Icon(
            icon,
            size: 22.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void setImage(File image) {
    setState(() {
      this.image = image;
    });
    if (hasExternalInput) {
      widget.imageStateChanged(image);
    }
  }

  void removeImage() {
    setState(() {
      this.image = null;
    });
    if (hasExternalInput) {
      widget.imageStateChanged(null);
    }
  }

  String extractSuggestions() {
    // Get last word between cursor and space
    var input =
        textController.text.substring(0, textController.selection.start);
    var splitText = input.split(' ');
    var q = splitText[splitText.length - 1];

    if (q.startsWith('#') || q.startsWith('@')) {
      return q;
    }
    return null;
  }
}

class TagSuggestionWidget extends StatelessWidget {
  final TagSuggestion suggestion;
  final VoidCallback applySuggestion;
  const TagSuggestionWidget({
    this.applySuggestion,
    this.suggestion,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.applySuggestion,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(this.suggestion.tag +
              " (" +
              this.suggestion.followers.toString() +
              ")"),
        ),
      ),
    );
  }
}

class UserSuggestionWidget extends StatelessWidget {
  final AuthorSuggestion suggestion;
  final VoidCallback applySuggestion;
  const UserSuggestionWidget({
    this.suggestion,
    this.applySuggestion,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var author = Author.fromAuthState(
        username: suggestion.login,
        avatarUrl: suggestion.avatar,
        color: suggestion.color);
    return InkWell(
      onTap: this.applySuggestion,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          AvatarWidget(author: author, size: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(this.suggestion.login,
                style: TextStyle(color: Utils.getAuthorColor(author, context))),
          ),
        ]),
      ),
    );
  }
}
