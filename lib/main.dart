import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/themes.dart';
import 'package:redux_logging/redux_logging.dart';

final logger = new LoggingMiddleware.printer();

void main() {
  final store =
      Store<AppState>(appReducer, initialState: AppState(), middleware: [
    appMiddleware,
  ]);
  runApp(OWMApp(
    store: store,
  ));
}

class OWMApp extends StatelessWidget {
  final Store<AppState> store;

  OWMApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Wykop Mobilny',
          theme: Themes.lightTheme(),
          routes: {
            '/': (context) => HotScreen(),
          },
        ));
  }
}
