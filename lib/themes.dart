import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      accentColor: Color(0xff4383af),
      primaryColor: Color(0xffffffff),
      primaryColorDark: Color(0xfff0f0f0),
      backgroundColor: Color(0xffffffff),
      cardColor: Color(0xffffffff),
      bottomAppBarColor: Color(0xffffffff),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Color(0xff4383af),
      primaryColor: Color(0xff292929),
      primaryColorDark: Color(0xff212121),
      backgroundColor: Color(0xff2c2c2c),
      cardColor: Color(0xff2c2c2c),
      bottomAppBarColor: Color(0xff292929),
    );
  }
}
