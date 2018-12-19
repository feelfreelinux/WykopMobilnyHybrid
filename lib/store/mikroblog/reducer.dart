import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all mikroblog screens into their reducers.
**/
MikroblogState mikroblogReducer(MikroblogState state, action) {
  return state.rebuild((b) => b
    ..activeState.replace(itemListReducer("ACTIVE", state.activeState, action))
    ..newestState.replace(itemListReducer("NEWEST", state.newestState, action))
    ..hot24State.replace(itemListReducer("HOT24", state.hot24State, action))
    ..hot6State.replace(itemListReducer("HOT6", state.hot6State, action))
    ..hot12State.replace(itemListReducer("HOT12", state.hot12State, action)));
}
