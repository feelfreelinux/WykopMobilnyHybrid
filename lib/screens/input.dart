import 'package:flutter/material.dart';
import 'package:owmflutter/app.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/model/new_entry_model.dart';
import 'package:owmflutter/screens/entry.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/input/selected_image.dart';
import 'dart:async';
import 'dart:io';
import 'package:provider/provider.dart';

enum InputType { ENTRY, ENTRY_COMMENT, LINK_COMMENT, PRIVATE_MESSAGE }

typedef Future InputBarCallback(InputData inputData);

class EntryInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<InputModel>(
        create: (context) => EditModel(
          entryCreated: (entry) {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              Utils.getPageTransition(
                EntryScreen(
                  model: EntryModel()..setData(entry),
                ),
              ),
            );
          },
        ),
        child: InputScreen(inputType: InputType.ENTRY),
      ),
    );
  }
}

class EditInputScreen extends StatelessWidget {
  final InputData inputData;
  final int id;
  final InputType inputType;
  final ValueChanged<EntryComment> commentEdited;
  final ValueChanged<Entry> entryEdited;
  final ValueChanged<LinkComment> linkCommentEdited;

  EditInputScreen(
      {this.inputData,
      this.id,
      this.inputType,
      this.commentEdited,
      this.entryEdited,
      this.linkCommentEdited});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<InputModel>(
        create: (context) => EditModel(
          entryEdited: (entry) {
            Navigator.of(context).pop();
            entryEdited(entry);
          },
          commentEdited: (comment) {
            Navigator.of(context).pop();
            commentEdited(comment);
          },
          linkCommentEdited: (comment) {
            Navigator.of(context).pop();
            linkCommentEdited(comment);
          },
          edit: true,
          itemId: this.id,
          inputType: inputType,
        ),
        child: InputScreen(inputType: this.inputType, inputData: inputData),
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
        return "Dodaj wpis";
      case InputType.ENTRY_COMMENT:
        return "Dodaj komentarz";
      case InputType.LINK_COMMENT:
        return "Dodaj komentarz";
      case InputType.PRIVATE_MESSAGE:
        return "Napisz wiadomość prywatną";
        break;
      default:
        return "";
    }
  }

  String get inputHintDialog {
    switch (widget.inputType) {
      case InputType.ENTRY:
        return "Dodać ten wpis?";
      case InputType.ENTRY_COMMENT:
        return "Dodać ten komentarz?";
      case InputType.LINK_COMMENT:
        return "Dodać ten komentarz?";
      case InputType.PRIVATE_MESSAGE:
        return "Wysłać tę wiadomość?";
        break;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<ShadowControlModel>(
        create: (context) => ShadowControlModel(),
        child: _SystemPadding(
          child: Scaffold(
            bottomNavigationBar: InputBarWidget(
              key: inputBarKey,
              existingInputData: widget.inputData,
              externalController:
                  textController, //TODO: nie zaznacza tekstu z przycisku, ukrywa klawiature
              imageStateChanged: (image) => setState(() => this.image = image),
            ),
            resizeToAvoidBottomPadding: false,
            appBar: AppbarNormalWidget(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              leading: RoundIconButtonWidget(
                icon: Icons.close,
                onTap: () async {
                  if (owmSettings.confirmExitWriting) {
                    var res = await showConfirmDialog(context,
                        "Wyjść z tego ekranu?\r\nZmiany zostaną utracone.");
                    if (!res) return;
                  }
                  Navigator.of(context).pop();
                },
                iconSize: 26.0,
                iconPadding: EdgeInsets.all(5.0),
              ),
              title: inputHint,
              actions: <Widget>[
                Builder(
                  builder: (context) => RoundIconButtonWidget(
                    icon: Icons.check,
                    onTap: () async {
                      if (this.textController.text.length >= 3 ||
                          this.image != null) {
                        if (owmSettings.confirmSend) {
                          var res =
                              await showConfirmDialog(context, inputHintDialog);
                          if (!res) return;
                        }

                        Provider.of<InputModel>(context, listen: false)
                            .onInputSubmitted(InputData(
                                body: (this.textController.text.length < 3 &&
                                        this.image != null)
                                    ? this.textController.text + "​​​​​"
                                    : this.textController.text,
                                file: this.image));
                      } else {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Treść jest za krótka")));
                      }
                    },
                    iconSize: 26.0,
                    iconPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Visibility(
                  visible: this.image != null,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 13.0, right: 14.0, bottom: 6.0),
                    child: SelectedImageWidget(
                      backgroundColor: Utils.backgroundGreyOpacity(context),
                      image: this.image,
                      onTap: () => inputBarKey.currentState.removeImage(),
                    ),
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 18.0, right: 18.0, bottom: 6.0),
                        child: Consumer<SuggestionsModel>(
                          builder: (context, model, _) => TextField(
                            autofocus: true,
                            onChanged: (text) {
                              model.loadSuggestions(inputBarKey.currentState
                                  .extractSuggestions());
                            },
                            style: DefaultTextStyle.of(context).style.merge(
                                  TextStyle(fontSize: 18.0),
                                ),
                            maxLines: null,
                            controller: textController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Napisz coś ciekawego',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
