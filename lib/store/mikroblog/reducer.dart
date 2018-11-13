import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

MikroblogState mikroblogReducer(MikroblogState state, action) {
  var newState = state.rebuild((b) => b
    ..listState
        .replace(createListReducer(state.listState, "MIKROBLOG", action)));
  return combineReducers<MikroblogState>(
    [
      TypedReducer<MikroblogState, SetEntriesAction>(_setEntriesAction),
      TypedReducer<MikroblogState, AddEntriesAction>(_addEntriesAction),
      TypedReducer<MikroblogState, UpdateEntryAction>(_setEntryAction),
    ],
  )(newState, action);
}

MikroblogState _setEntriesAction(
    MikroblogState state, SetEntriesAction action) {
  return state.rebuild((b) => b
    ..entries.replace(BuiltMap<int, Entry>.from(_listToMap(action.entries)))
    ..entriesIds.addAll(action.entries.map((el) {
      return el.id;
    })));
}

MikroblogState _setEntryAction(MikroblogState state, UpdateEntryAction action) {
  return state.rebuild((b) => b..entries[action.entry.id] = action.entry);
}

MikroblogState _addEntriesAction(
    MikroblogState state, AddEntriesAction action) {
  return state.rebuild((b) => b
    ..entries.addAll(_listToMap(action.entries))
    ..entriesIds.addAll(action.entries.map((el) {
      return el.id;
    })));
}

Map<int, Entry> _listToMap(BuiltList<Entry> entries) {
  return Map.fromIterable(entries, key: (v) => v.id, value: (v) => v);
}
