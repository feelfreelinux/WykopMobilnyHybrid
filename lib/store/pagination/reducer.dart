import 'package:redux/redux.dart';
import 'package:owmflutter/store/list/actions.dart';
import 'package:owmflutter/store/store.dart';

PaginationState createItemsReducer(PaginationState state, String type, action) {
  if (action is TypedAction && action.type == type) {
    return combineReducers<PaginationState>(
      [
        TypedReducer<PaginationState, AddItems>(_addEntries),
        TypedReducer<PaginationState, ClearItems>(_clearEntries),
      ],
    )(state, action);
  }
  return state;
}

PaginationState _addEntries(PaginationState state, AddItems action) {
  return state.rebuild((b) => b..itemIds.addAll(action.itemIds));
}

PaginationState _clearEntries(PaginationState state, ClearItems action) {
  return state.rebuild((b) => b..itemIds.clear());
}
