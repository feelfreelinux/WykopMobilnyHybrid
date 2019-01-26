import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
  InputBarWidget(this.callback,
      {@required Key key, this.externalController, this.imageStateChanged})
      : super(key: key);
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: BottomAppBar(
        color: Theme.of(context).primaryColor,
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
          ),
          MediaButtonWidget(
            show: showMediaButton,
            onTap: () => this.pickImage(ImageSource.gallery),
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
                  color: Color(0x267f7f7f),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
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
                                  child:
                                      StoreConnector<AppState, SuggestCallback>(
                                    converter: (store) => (q) => store.dispatch(
                                        loadSuggestions(q, Completer())),
                                    builder: (context, suggestCallback) =>
                                        TextField(
                                          focusNode: focusNode,
                                          cursorWidth: 1.5,
                                          cursorRadius: Radius.circular(20.0),
                                          onChanged: (text) {
                                            suggestCallback(
                                                extractSuggestions());
                                          },
                                          style: DefaultTextStyle.of(context)
                                              .style
                                              .merge(
                                                TextStyle(fontSize: 14.0),
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
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            border: InputBorder.none,
                                            hintText: 'Treść komentarza',
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          EmoticonButtonWidget(onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SendButtonWidget(
            onTap: () {
              this._sendButtonClicked();
            },
            isEmpty: isEmpty,
            sending: sending,
          ),
        ],
      ),
    );
  }

  Widget _drawSuggestions() {
    return StoreConnector<AppState, SuggestionsState>(
      converter: (store) => store.state.suggestionsState,
      builder: (context, suggestions) {
        return Column(
            children: List()
              ..addAll(suggestions.authorSuggestions
                  .map((s) => Text(s.login))
                  .toList())
              ..addAll(
                  suggestions.tagSuggestions.map((s) => Text(s.tag)).toList()));
      },
    );
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
                            this._sendButtonClicked();
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
                            this._sendButtonClicked();
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

  void _sendButtonClicked() {
    setState(() {
      this.sending = true;
    });
    this
        .widget
        .callback(InputData(body: this.textController.text, file: this.image))
        .then((_) {
      setState(() {
        this.sending = false;
        this.textController.clear();
      });
      removeImage();
    });
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
