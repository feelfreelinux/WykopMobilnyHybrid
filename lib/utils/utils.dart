import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/author_relation_builder.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'owm_settings.dart';
export 'owm_settings.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:io' show Platform;
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as cct;


void launchDefaultBrowser(String url) {
  urlLauncher.launch(url);
}

void launchUrl(String url, {BuildContext context}) async {
  var owmSettings = Provider.of<OWMSettings>(context, listen: false);

  if (owmSettings.linkOpenBrowser) {
    launchDefaultBrowser(url);
  } else {
      await cct.launch(
        url,
        option: new cct.CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new cct.CustomTabsAnimation.slideIn(),
          extraCustomTabs: <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],        
        ),
      );
  }
}

class Utils {
  static Color getAuthorColor(int color, BuildContext context) {
    switch (color) {
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

  static Color getRelationColor(AuthorRelation relation) {
    if (relation == AuthorRelation.User) {
      return Colors.blue;
    } else if (relation == AuthorRelation.Author) {
      return Colors.deepOrange;
    } else if (relation == AuthorRelation.Highlight) {
      return Colors.green;
    } else {
      return Colors.transparent;
    }
  }

  static Color getGenderColor(AuthorSex sex) {
    if (sex == AuthorSex.MALE) {
      return Colors.blue;
    } else if (sex == AuthorSex.FEMALE) {
      return Colors.pink;
    } else {
      return Colors.transparent;
    }
  }

  static Route getPageSlideToUp(Widget screen) {
    if (Platform.isAndroid) {
      return PageRouteBuilder(
        barrierColor: Colors.black26,
        opaque: true,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return screen;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutQuart)),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 300),
      );
    } else {
      return CupertinoPageRoute(builder: (context) => screen);
    }
  }

  static Route getPageSlideRight(Widget screen) {
    if (Platform.isAndroid) {
      return PageRouteBuilder(
        barrierColor: Colors.black26,
        opaque: true,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return screen;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutQuart)),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 300),
      );
    } else {
      return CupertinoPageRoute(builder: (context) => screen);
    }
  }

  static Route getPageTransition(Widget screen) {
    if (true) { // okay i know its crappy but i need to fix one thing with iOS first
      return PageRouteBuilder(
        opaque: true,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return screen;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 300),
      );
    } else {
      return CupertinoPageRoute(builder: (_) => Container(child: screen));
    }
  }

  static String getDateFormat(String date, String format) {
    var formatter = DateFormat(format ?? 'dd-MM-yyyy');
    var newDate = DateTime.parse(date);
    return formatter.format(newDate);
  }

  static String getSimpleDate(String date) {
    var newDate = DateTime.parse(date);
    return timeago.format(newDate, locale: 'pl');
  }

  static Color voteIconStateColor({bool isSelected, bool negativeIcon}) {
    if (isSelected) {
      return Colors.white;
    } else {
      return negativeIcon ? Colors.red[800] : Colors.green[800];
    }
  }

  static Color voteBackgroundStateColor(BuildContext context,
      {bool isSelected, bool isComment, bool negativeIcon}) {
    if (isSelected) {
      return negativeIcon ? Colors.red[800] : Colors.green[800];
    } else {
      return isComment
          ? backgroundCommentButton(context)
          : backgroundGreyOpacity(context);
    }
  }

  static Color backgroundGreyOpacity(BuildContext context) {
    return Theme.of(context).iconTheme.color.withOpacity(
        Theme.of(context).brightness == Brightness.light ? 0.10 : 0.20);
  }

  static Color backgroundGrey(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xfff0f0f0)
        : Color(0xff282828);
  }

  static Color backgroundCommentButton(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xffffffff)
        : Color(0xff333333);
  }

  static BoxDecoration appBarShadow(bool show,
      {double blurRadius = 2.0, double opacity = 0.2}) {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(show ? opacity : 0.0),
          blurRadius: show ? blurRadius : 0.0,
        ),
      ],
    );
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

  static void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Skopiowano do schowka")));
  }

  static void launchURL(String url, BuildContext context) async {
    launchUrl(url, context: context);
  }
}
