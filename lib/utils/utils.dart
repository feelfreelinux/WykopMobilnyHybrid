import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:owmflutter/models/models.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:io' show Platform;
import 'package:url_launcher/url_launcher.dart';

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
      return CupertinoPageRoute(builder: (context) => screen);
    }
  }

  static String getSimpleDate(String date) {
    var newDate = DateTime.parse(date);
    return timeago.format(newDate, locale: 'pl');
  }

  static Color voteIconStateColor({bool isSelected, bool negativeIcon}) {
    if (isSelected) {
      return Colors.white;
    } else {
      if (negativeIcon) {
        return Colors.red[800];
      } else {
        return Colors.green[800];
      }
    }
  }

  static Color voteBackgroundStateColor({bool isSelected, bool negativeIcon}) {
    if (isSelected) {
      if (negativeIcon) {
        return Colors.red[800];
      } else {
        return Colors.green[800];
      }
    } else {
      if (negativeIcon) {
        return Colors.red[800].withOpacity(0.1);
      } else {
        return Colors.green[800].withOpacity(0.1);
      }
    }
  }

  static String polishPlural(
      {num count, String first, String many, String other}) {
    if (count == 1) {
      return first; // komentarz
    } else if (count % 10 >= 2 &&
        count % 10 <= 4 &&
        (count % 100 < 10 || count % 100 >= 20)) {
      return other; // komentarze
    } else {
      return many; // komentarzy
    }
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nie można załadować linku';
    }
  }
}
