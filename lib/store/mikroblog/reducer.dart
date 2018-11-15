import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

MikroblogState mikroblogReducer(String type, MikroblogState state, action) {
  var newState = state.rebuild((b) => b
    ..entriesState.replace(
        createEntriesReducer(state.entriesState, type + "_ENTRIES", action))
    ..listState
        .replace(createListReducer(state.listState, type, action)));
  return combineReducers<MikroblogState>([])(newState, action);
}
