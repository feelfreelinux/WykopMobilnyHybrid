import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      accentColor: Color(0xff4383af),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      bottomAppBarColor: Colors.white,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Color(0xff4383af),
      primaryColor: Color(0xff2c2c2c),
      scaffoldBackgroundColor: Color(0xff2c2c2c),
      backgroundColor: Color(0xff2c2c2c),
      cardColor: Color(0xff2c2c2c),
      bottomAppBarColor: Color(0xff2c2c2c),
    );
  }
}
