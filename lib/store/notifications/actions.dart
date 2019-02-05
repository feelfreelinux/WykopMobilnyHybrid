import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

import 'dart:async';

ThunkAction<AppState> loadHashTagNotifications(
    bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        "NOTIFICATIONS_HASH_TAGS",
        refresh,
        (page) => api.notifications.getHashtagNotifications(page),
        store.state.notificationsState.hashTagsState.listState,
        completer));
  };
}

ThunkAction<AppState> markNotificationAsRead(int id) {
  return (Store<AppState> store) async {
    var notification = store.state.entitiesState.notifications[id]
        .rebuild((b) => b..isNew = false);

    store.dispatch(AddEntitiesAction(
        entities: EntitiesState().rebuild(
            (b) => b..notifications.putIfAbsent(id, () => notification))));
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
