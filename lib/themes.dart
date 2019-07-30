import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme({int accentColor}) {
    return ThemeData(
      brightness: Brightness.light,
      accentColor: Color(accentColor),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      bottomAppBarColor: Colors.white,
      toggleableActiveColor: Color(accentColor),
    );
  }

  static ThemeData darkTheme({int accentColor}) {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Color(accentColor),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      cardColor: Colors.black,
      bottomAppBarColor: Colors.black,
      toggleableActiveColor: Color(accentColor),
    );
  }
}
