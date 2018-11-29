import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> loadIndex(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        "MYWYKOP_INDEX",
        refresh,
        (page) => api.mywykop.getIndex(page),
        store.state.myWykopState.indexState.listState,
        completer));
  };
}
