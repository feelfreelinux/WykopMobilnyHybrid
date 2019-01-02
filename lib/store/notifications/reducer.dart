import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all notifications screens into their reducers.
**/
NotificationsState notificationsReducer(NotificationsState state, action) {
  return state.rebuild((b) => b
    ..notificationsState.replace(
        itemListReducer("NOTIFICATIONS_USER", state.notificationsState, action))
    ..hashTagsState.replace(itemListReducer(
        "NOTIFICATIONS_HASH_TAGS", state.hashTagsState, action)));
}
