import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:timeago/timeago.dart' as timeago;

class Utils {
  static Color getAuthorColor(Author author, BuildContext context) {
    switch (author.color) {
      case 0:
        return Color(0xff339933);
      case 1:
        return Color(0xffff5917);
      case 2:
        return Color(0xffBB0000);
      case 5:
        return Theme.of(context).textTheme.title.color;
      case 999:
        return Color(0xffBF9B30);
      case 1001:
        return Color(0xff999999);
      case 1002:
        return Color(0xff999999);
      case 2001:
        return Color(0xff3F6FA0);
      default:
        return Colors.blue;
    }
  }

  static String getSimpleDate(String date) {
    var newDate = DateTime.parse(date);
    return timeago.format(newDate, locale: 'pl');
  }
}