import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild(
      (b) => b..entries.replace(entriesReducer(state.entries, action)));
}

Reducer<BuiltList<Entry>> entriesReducer =
    combineReducers<BuiltList<Entry>>([
  TypedReducer<BuiltList<Entry>, SetEntriesAction>(_setEntriesAction)
]);

BuiltList<Entry> _setEntriesAction(
    BuiltList<Entry> state, SetEntriesAction action) {
  return state.rebuild((b) => b..replace(action.entries));
}
