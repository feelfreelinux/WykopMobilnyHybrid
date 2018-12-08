import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

ItemListState itemListReducer(String type, ItemListState state, action) {
  var newState = state.rebuild((b) => b
    ..paginationState.replace(
        createItemsReducer(state.paginationState, type + "_ITEMS", action))
    ..listState.replace(createListReducer(state.listState, type, action)));
  return combineReducers<ItemListState>([])(newState, action);
}
