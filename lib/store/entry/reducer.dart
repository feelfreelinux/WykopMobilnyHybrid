import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

Reducer<EntryScreensState> entryScreenReducer = combineReducers([
  TypedReducer<EntryScreensState, SetEntryAction>(_setEntry),
]);

EntryScreensState _setEntry(EntryScreensState state, SetEntryAction action) {
  return state.rebuild((b) => b
    ..states.putIfAbsent(action.screenId, () => EntryScreenState())
    ..states.updateValue(
        action.screenId,
        (b) => b
          ..ids.clear()
          ..ids.addAll(action.ids)));
}
