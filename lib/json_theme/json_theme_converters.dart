import 'package:flutter/material.dart';
import 'package:owmflutter/json_theme/json_theme_exception.dart';

var argbHexRegExp = new RegExp(
  r"^#[A-Fa-f0-9]{8}$",
  caseSensitive: false,
  multiLine: false,
);

var rgbHexRegExp = new RegExp(
  r"^#[A-Fa-f0-9]{6}$",
  caseSensitive: false,
  multiLine: false,
);

var colorFunctionRegExp = new RegExp(
    r"^([a-z]+\((-?[0-9]+(\.[0-9]+)?%?)(,(-?[0-9]+(\.[0-9]+)?%?))*\))$",
    multiLine: false);

class JsonThemeConverters {
  static Color convertColor(dynamic jsonColor) {
    if (jsonColor is String) {
      if (argbHexRegExp.hasMatch(jsonColor)) {
        return new Color(
            int.parse(jsonColor.substring(1).toLowerCase(), radix: 16));
      } else if (rgbHexRegExp.hasMatch(jsonColor)) {
        return new Color(
            int.parse("ff" + jsonColor.substring(1).toLowerCase(), radix: 16));
      } else if (colorFunctionRegExp
          .hasMatch(jsonColor.replaceAll(" ", "").toLowerCase())) {
        // var preprocessedFunc = jsonColor.replaceAll(" ", "").toLowerCase();
        //todo: finish
      } else if (jsonColor == "transparent") {
        return new Color.fromARGB(0, 0, 0, 0);
      } else {
        throw new JsonThemeException(
            "Invalid string color representation $jsonColor");
      }
    } else {
      throw new JsonThemeException(
          "A color in JsonTheme cannot be a ${jsonColor.runtimeType.toString()}");
    }
    return null;
  }
}
