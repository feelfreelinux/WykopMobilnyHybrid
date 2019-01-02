import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> loadHot6(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        MIKROBLOG_HOT6,
        refresh,
        (page) => api.entries.getHot(page, "6"),
        store.state.mikroblogState.hot6State.listState,
        completer));
  };
}

ThunkAction<AppState> loadHot12(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        MIKROBLOG_HOT12,
        refresh,
        (page) => api.entries.getHot(page, "12"),
        store.state.mikroblogState.hot12State.listState,
        completer));
  };
}

ThunkAction<AppState> loadHot24(bool refresh, Completer complater) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        MIKROBLOG_HOT24,
        refresh,
        (page) => api.entries.getHot(page, "24"),
        store.state.mikroblogState.hot24State.listState,
        complater));
  };
}

ThunkAction<AppState> loadNewest(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        MIKROBLOG_NEWEST,
        refresh,
        (page) => api.entries.getNewest(page),
        store.state.mikroblogState.newestState.listState,
        completer));
  };
}

ThunkAction<AppState> loadActive(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        MIKROBLOG_ACTIVE,
        refresh,
        (page) => api.entries.getActive(page),
        store.state.mikroblogState.activeState.listState,
        completer));
  };
}
