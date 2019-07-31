import 'package:flutter/material.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_button.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_textfield.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_title.dart';

class InfoProfileEdit extends StatefulWidget {
  _InfoProfileEditState createState() => _InfoProfileEditState();
}

class _InfoProfileEditState extends State<InfoProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputTitleWidget("Imię i nazwisko"),
        InputTextFieldWidget(),
        InputTitleWidget("Miasto"),
        InputTextFieldWidget(),
        InputTitleWidget("Strona WWW"),
        InputTextFieldWidget(),
        InputTitleWidget("Publiczny e-mail"),
        InputTextFieldWidget(),
        InputTitleWidget("Facebook"),
        InputTextFieldWidget(),
        InputTitleWidget("Twitter"),
        InputTextFieldWidget(),
        InputTitleWidget("Instagram"),
        InputTextFieldWidget(),
        InputTitleWidget("O mnie"),
        InputTextFieldWidget(maxLines: null,),
        InputButtonWidget(text: "Zapisz"),
      ],
    );
  }
}
