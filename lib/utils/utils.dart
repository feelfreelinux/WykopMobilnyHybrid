import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:io' show Platform;

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

  static Route getPageTransition(Widget screen) {
    if (Platform.isAndroid) {
      return PageRouteBuilder(
          opaque: true,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return screen;
          },
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(
                opacity:
                    Tween<double>(begin: 0.0, end: 1.0).animate(animation1),
                child: child);
          },
          transitionDuration: Duration(milliseconds: 400));
    } else {
      return CupertinoPageRoute(
        builder: (context) => screen
      );
    }
  }

  static String getSimpleDate(String date) {
    var newDate = DateTime.parse(date);
    return timeago.format(newDate, locale: 'pl');
  }
}
