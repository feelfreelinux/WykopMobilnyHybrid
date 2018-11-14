import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/themes.dart';

class OwmApp extends StatelessWidget {
  final Store<AppState> store;

  OwmApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Wykop Mobilny',
          theme: Themes.lightTheme(),
          routes: {
            '/': (context) => MikroblogScreen(),
          },
        ));
  }
}
