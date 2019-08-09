import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:owmflutter/app.dart';
import 'package:flutter/services.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  timeago.setLocaleMessages('pl', timeago.PlMessages());
  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    statusBarColor: Colors.transparent,
  ));

  runApp(RestartWidget(
      child: OwmApp(
  )));
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
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) =>   SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    statusBarColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
  )));


  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
