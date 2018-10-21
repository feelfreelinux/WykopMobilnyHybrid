import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild(
      (b) => b..entries.replace(entriesReducer(state.entries, action)));
}

Reducer<BuiltList<EntryResponse>> entriesReducer =
    combineReducers<BuiltList<EntryResponse>>([
  TypedReducer<BuiltList<EntryResponse>, SetEntriesAction>(_setEntriesAction)
]);

BuiltList<EntryResponse> _setEntriesAction(
    BuiltList<EntryResponse> state, SetEntriesAction action) {
  return state.rebuild((b) => b..replace(action.entries));
}
