import 'package:redux/redux.dart';
import 'package:owmflutter/store/list/actions.dart';
import 'package:owmflutter/store/store.dart';

ListState createListReducer(ListState state, String type, action) {
  if (action is TypedAction && action.type == type) {
    return combineReducers<ListState>(
      [
        TypedReducer<ListState, SetLoading>(_setLoading),
        TypedReducer<ListState, SetPageNumber>(_setPageNumber),
        TypedReducer<ListState, SetHaveReachedEnd>(_setHasFullyReachedEnd),
      ],
    )(state, action);
  }
  return state;
}

ListState _setLoading(ListState state, SetLoading action) {
  return state.rebuild((b) => b.isLoading = action.isLoading);
}

ListState _setPageNumber(ListState state, SetPageNumber action) {
  return state.rebuild((b) => b.page = action.number);
}

ListState _setHasFullyReachedEnd(ListState state, SetHaveReachedEnd action) {
  return state.rebuild((b) => b..haveReachedEnd = action.haveReachedEnd);
}
