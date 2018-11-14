import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart' show thunkMiddleware;
import 'package:owmflutter/app.dart';

void main() {
  final store =
      Store<AppState>(appReducer, initialState: AppState(), middleware: [
    appMiddleware,
    thunkMiddleware,
  ]);

  runApp(OwmApp(
    store: store,
  ));
}
