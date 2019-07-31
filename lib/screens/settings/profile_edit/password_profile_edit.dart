import 'package:flutter/material.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_button.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_textfield.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_title.dart';

class PasswordProfileEdit extends StatefulWidget {
  _PasswordProfileEditState createState() => _PasswordProfileEditState();
}

class _PasswordProfileEditState extends State<PasswordProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputTitleWidget("Podaj aktualne hasło"),
        InputTextFieldWidget(obscureText: true),
        InputTitleWidget("Podaj nowe hasło"),
        InputTextFieldWidget(obscureText: true),
        InputTitleWidget("Powtórz nowe hasło"),
        InputTextFieldWidget(obscureText: true),
        InputButtonWidget(text: "Zmień hasło"),
      ],
    );
  }
}
