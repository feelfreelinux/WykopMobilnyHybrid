import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

ItemListState itemListReducer(String type, ItemListState state, action) {
  var newState = state.rebuild((b) => b
    ..paginationState.replace(
        createItemsReducer(state.paginationState, type + "_ITEMS", action))
    ..errorState.replace(createErrorReducer(state.errorState, type, action))
    ..listState.replace(createListReducer(state.listState, type, action)));
  return combineReducers<ItemListState>([])(newState, action);
}
