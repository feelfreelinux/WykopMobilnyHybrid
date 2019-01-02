import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all entry screens into their reducers.
**/
EntryScreensState entryScreenReducer(EntryScreensState state, action) {
  if (action is TypedAction && action.type.startsWith(ENTRY_PREFIX)) {
    var id = action.type.split('_')[1];
    var newState = state
        .rebuild((b) => b..states.putIfAbsent(id, () => EntryScreenState()));
    return newState.rebuild((e) => e
      ..states.updateValue(
          id,
          (entryScreenState) => entryScreenState.rebuild(
                (k) => k
                  ..replace(_entryScreenReducer(newState.states[id], action))
                  ..errorState.replace(createErrorReducer(
                      newState.states[id].errorState, ENTRY_PREFIX + id, action)),
              )));
  } else {
    return state;
  }
}

Reducer<EntryScreenState> _entryScreenReducer = combineReducers([
  TypedReducer<EntryScreenState, SetEntryAction>(_setEntry),
]);

EntryScreenState _setEntry(EntryScreenState state, SetEntryAction action) {
  return state.rebuild((b) => b
    ..ids.clear()
    ..ids.addAll(action.ids));
}
