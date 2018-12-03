import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

/*
  Reducer that directs actions of all mikroblog screens into their reducers.
**/
MikroblogState mikroblogReducer(MikroblogState state, action) {
  return state.rebuild((b) => b
    ..activeState.replace(entriesReducer("ACTIVE", state.activeState, action))
    ..newestState.replace(entriesReducer("NEWEST", state.newestState, action))
    ..hot24State.replace(entriesReducer("HOT24", state.hot24State, action))
    ..hot6State.replace(entriesReducer("HOT6", state.hot6State, action))
    ..hot12State.replace(entriesReducer("HOT12", state.hot12State, action)));
}
