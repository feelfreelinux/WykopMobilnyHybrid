import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/widgets/input/emoticon_button.dart';
import 'package:owmflutter/widgets/input/selected_image.dart';
import 'dart:async';
import 'dart:io';

class InputScreen extends StatefulWidget {
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController textController = TextEditingController();
  File image;
  final inputBarKey = new GlobalKey<InputBarWidgetState>();
  @override
  Widget build(BuildContext context) {
    return _SystemPadding(
      child: Scaffold(
        bottomNavigationBar: StoreConnector<AppState, dynamic>(
            converter: (store) => (Completer completer, InputData inputData) =>
                store.dispatch(addEntryComment(0, inputData, completer)),
            builder: (context, callback) => InputBarWidget(
                (inputData) {
                  var completer = Completer();
                  callback(completer, inputData);
                  return completer.future;
                },
                key: inputBarKey,
                externalController: textController,
                imageStateChanged: (image) {
                  setState(() {
                    this.image = image;
                  });
                })),
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: AppBar(
            title: Text('Napisz wpis'),
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
                            child: StoreConnector<AppState, SuggestCallback>(
                              converter: (store) => (q) => store
                                  .dispatch(loadSuggestions(q, Completer())),
                              builder: (context, suggestCallback) => TextField(
                                    cursorWidth: 1.5,
                                    cursorRadius: Radius.circular(20.0),
                                    onChanged: (text) {
                                      suggestCallback(inputBarKey.currentState
                                          .extractSuggestions());
                                    },
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .merge(
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
