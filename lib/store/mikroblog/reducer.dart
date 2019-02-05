import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all mikroblog screens into their reducers.
**/
MikroblogState mikroblogReducer(MikroblogState state, action) {
  return state.rebuild((b) => b
    ..activeState
        .replace(itemListReducer(MIKROBLOG_ACTIVE, state.activeState, action))
    ..newestState
        .replace(itemListReducer(MIKROBLOG_NEWEST, state.newestState, action))
    ..hot24State
        .replace(itemListReducer(MIKROBLOG_HOT24, state.hot24State, action))
    ..hot6State
        .replace(itemListReducer(MIKROBLOG_HOT6, state.hot6State, action))
    ..hot12State
        .replace(itemListReducer(MIKROBLOG_HOT12, state.hot12State, action))
    ..favoriteState
        .replace(itemListReducer(MIKROBLOG_FAVORITE, state.favoriteState, action)));
}
