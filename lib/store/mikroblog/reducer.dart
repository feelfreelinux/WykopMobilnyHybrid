import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

MikroblogState mikroblogReducer(MikroblogState state, action) {
  var newState = state.rebuild((b) => b
    ..entriesState.replace(
        createEntriesReducer(state.entriesState, "MIKROBLOG_ENTRIES", action))
    ..listState
        .replace(createListReducer(state.listState, "MIKROBLOG", action)));
  return combineReducers<MikroblogState>([])(newState, action);
}
