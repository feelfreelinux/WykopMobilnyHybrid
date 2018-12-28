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

class InputBarWidget extends StatefulWidget {
  final InputBarCallback callback;
  InputBarWidget(this.callback, {@required Key key}) : super(key: key);
  InputBarWidgetState createState() => InputBarWidgetState();
}

class InputBarWidgetState extends State<InputBarWidget> {
  bool showMarkdownBar = false;
  bool showMediaButton = true;
  bool showTextFormatBar = false;
  bool clickTextField = false;
  bool isEmpty = true;
  bool sending = false;
  File image;

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
    setState(() {
      this.image = image;
    });
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
            _drawInputBar(),
            _drawButtons(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(() => _watchTextChanges());
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
                          setState(() {
                            this.image = null;
                          });
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
                                            suggestCallback(extractSuggestions());
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
    return StoreConnector<AppState, List<AuthorSuggestion>>(
      converter: (store) => store.state.suggestionsState.authorSuggestions,
      builder: (context, suggestions) {
        return Column(
          children: suggestions.map((s) => Text(s.login)).toList(),
        );
      },
    );
  }

  Widget _drawButtons() {
    if (showMarkdownBar) {
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
                  _drawIconRound(Icons.text_format, () {
                    setState(() {
                      showTextFormatBar = true;
                    });
                  }),
                  _drawIconRound(
                      Icons.link,
                      () => insertSelectedText("[",
                          suffix: "](https://wykop.pl)")),
                  _drawIconRound(Icons.visibility_off,
                      () => insertSelectedText("\n! ", suffix: "\n")),
                  _drawIconRound(Icons.list, () => {}),
                  _drawIconRound(
                      Icons.image, () => this.pickImage(ImageSource.gallery)),
                  _drawIconRound(Icons.camera_alt,
                      () => this.pickImage(ImageSource.camera)),
                  _drawIconRound(Icons.fullscreen, () {}),
                ]
              : <Widget>[
                  _drawIconRound(Icons.arrow_back, () {
                    setState(() {
                      showTextFormatBar = false;
                    });
                  }),
                  _drawIconRound(Icons.format_bold,
                      () => insertSelectedText("**", suffix: "**")),
                  _drawIconRound(Icons.format_italic,
                      () => insertSelectedText("_", suffix: "_")),
                  _drawIconRound(Icons.format_quote,
                      () => insertSelectedText("\n> ", suffix: "\n")),
                  _drawIconRound(
                      Icons.code, () => insertSelectedText("`", suffix: "`")),
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
        .then((_) => setState(() {
              this.image = null;
              this.sending = false;
              this.textController.clear();
            }));
  }

  Widget _drawIconRound(IconData iconData, VoidCallback onClick) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: Color(0x337f7f7f),
        ),
      ),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(100.0),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            iconData,
            size: 22.0,
          ),
        ),
      ),
    );
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