import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

Reducer<MikroblogState> mikroblogReducer = combineReducers<MikroblogState>(
  [
    TypedReducer<MikroblogState, SetEntriesAction>(_setEntriesAction),
    TypedReducer<MikroblogState, SetLoading>(_setLoading),
    TypedReducer<MikroblogState, SetPageNumber>(_setPageNumber),
    TypedReducer<MikroblogState, AddEntriesAction>(_addEntriesAction),
    TypedReducer<MikroblogState, SetHaveReachedEnd>(_setFullyLoaded),
    TypedReducer<MikroblogState, UpdateEntryAction>(_setEntryAction),
  ],
);

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

MikroblogState _setLoading(MikroblogState state, SetLoading action) {
  return state.rebuild((b) => b.isLoading = action.isLoading);
}

MikroblogState _setPageNumber(MikroblogState state, SetPageNumber action) {
  return state.rebuild((b) => b.page = action.number);
}

MikroblogState _addEntriesAction(
    MikroblogState state, AddEntriesAction action) {
  return state.rebuild((b) => b
    ..entries.addAll(_listToMap(action.entries))
    ..entriesIds.addAll(action.entries.map((el) {
      return el.id;
    })));
}

MikroblogState _setFullyLoaded(MikroblogState state, SetHaveReachedEnd action) {
  return state.rebuild((b) => b..haveReachedEnd = action.haveReachedEnd);
}

Map<int, Entry> _listToMap(BuiltList<Entry> entries) {
  return Map.fromIterable(entries, key: (v) => v.id, value: (v) => v);
}
