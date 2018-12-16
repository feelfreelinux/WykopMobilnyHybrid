import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> loadHashTagNotifications(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        "NOTIFICATIONS_HASH_TAGS",
        refresh,
        (page) => api.notifications.getHashtagNotifications(page),
        store.state.notificationsState.hashTagsState.listState,
        completer));
  };
}

ThunkAction<AppState> loadNotifications(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        "NOTIFICATIONS_USER",
        refresh,
        (page) => api.notifications.getNotifications(page),
        store.state.notificationsState.hashTagsState.listState,
        completer));
  };
}
