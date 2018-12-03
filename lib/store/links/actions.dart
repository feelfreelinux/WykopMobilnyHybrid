import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> loadPromoted(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        "PROMOTED",
        refresh,
        (page) => api.links.getPromoted(page),
        store.state.linksState.promotedState.listState,
        completer));
  };
}
