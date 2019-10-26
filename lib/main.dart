import 'dart:async';
import 'dart:math';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/app.dart';
import 'package:flutter/services.dart';
import 'package:owmflutter/widgets/notifications_handler.dart';
import 'package:timeago/timeago.dart' as timeago;
void main() {
  timeago.setLocaleMessages('pl', timeago.PlMessages());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(RestartWidget(child: OwmApp()));

  print("OKEEEEJ");
  BackgroundFetch.registerHeadlessTask(fetchNotificationsTask);
}

class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({this.child});

  static restartApp(BuildContext context) {
    final _RestartWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => new _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = new UniqueKey();

  void restartApp() {
    this.setState(() {
      key = new UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: key,
      child: widget.child,
    );
  }
}
