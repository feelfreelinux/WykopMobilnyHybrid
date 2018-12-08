import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

/*
  Reducer that directs actions of all notifications screens into their reducers.
**/
NotificationsState notificationsReducer(NotificationsState state, action) {
  return state.rebuild((b) => b
    ..notificationsState.replace(itemListReducer("NOTIFICATIONS_USER", state.notificationsState, action))
    ..hashTagsState
        .replace(itemListReducer("NOTIFICATIONS_HASH_TAGS", state.hashTagsState, action)));
}
