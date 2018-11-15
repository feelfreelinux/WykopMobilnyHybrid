import 'package:redux/redux.dart';
import 'package:owmflutter/store/list/actions.dart';
import 'package:owmflutter/store/store.dart';

EntriesState createEntriesReducer(EntriesState state, String type, action) {
  if (action is TypedAction && action.type == type) {
    return combineReducers<EntriesState>(
      [
        TypedReducer<EntriesState, AddEntries>(_addEntries),
        TypedReducer<EntriesState, ClearEntries>(_clearEntries),
      ],
    )(state, action);
  }
  return state;
}

EntriesState _addEntries(EntriesState state, AddEntries action) {
  return state.rebuild((b) => b..entryIds.addAll(action.entriesIds));
}

EntriesState _clearEntries(EntriesState state, ClearEntries action) {
  return state.rebuild((b) => b..entryIds.clear());
}
