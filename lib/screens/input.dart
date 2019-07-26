import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/widgets/input/emoticon_button.dart';
import 'package:owmflutter/widgets/input/selected_image.dart';
import 'dart:async';
import 'dart:io';

import 'package:provider/provider.dart';

enum InputType {
  ENTRY,
  ENTRY_COMMENT,
  LINK_COMMENT,
  PRIVATE_MESSAGE,
}

typedef Future InputBarCallback(InputData inputData);

class EntryInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputScreen(
        inputType: InputType.ENTRY,
        sendCallback: (inputData) async {
          return;
        },
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  final InputType inputType;
  final InputBarCallback sendCallback;
  final InputData inputData;

  InputScreen({this.inputType, this.sendCallback, this.inputData});

  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController textController = TextEditingController();
  File image;
  final inputBarKey = new GlobalKey<InputBarWidgetState>();

  String get inputHint {
    switch (widget.inputType) {
      case InputType.ENTRY:
        return "wpis";
      case InputType.ENTRY_COMMENT:
        return "komentarz";
      case InputType.LINK_COMMENT:
        return "komentarz";
      case InputType.PRIVATE_MESSAGE:
        return "wiadomość prywatną";
        break;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return _SystemPadding(
      child: Scaffold(
        bottomNavigationBar: InputBarWidget(
          widget.sendCallback,
          key: inputBarKey,
          externalController: textController,
          imageStateChanged: (image) {
            setState(() {
              this.image = image;
            });
          },
        ),
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: AppBar(
            title: Text('Napisz $inputHint'),
            iconTheme: IconThemeData(
              color: Colors.blueAccent,
            ),
            elevation: 0.0,
          ),
        ),
        body: Container(
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
                    inputBarKey.currentState.removeImage();
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
                              builder: (context, model, _) => TextField(
                                cursorWidth: 1.5,
                                cursorRadius: Radius.circular(20.0),
                                onChanged: (text) {
                                  model.loadSuggestions(inputBarKey.currentState
                                      .extractSuggestions());
                                },
                                style: DefaultTextStyle.of(context).style.merge(
                                      TextStyle(fontSize: 14.0),
                                    ),
                                maxLines: null,
                                controller: this.textController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Treść',
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
          ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 150),
        child: child);
  }
}
