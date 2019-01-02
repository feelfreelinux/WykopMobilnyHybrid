import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart' show thunkMiddleware;
import 'package:owmflutter/app.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  final store =
      Store<AppState>(appReducer, initialState: AppState(), middleware: [
    thunkMiddleware,
  ]);

  runApp(OwmApp(
    store: store,
  ));
}
