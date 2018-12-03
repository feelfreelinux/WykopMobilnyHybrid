import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

LinksListState linksListReducer(String type, LinksListState state, action) {
  var newState = state.rebuild((b) => b
    ..itemsState
        .replace(createItemsReducer(state.itemsState, type + "_ITEMS", action))
    ..listState.replace(createListReducer(state.listState, type, action)));
  return combineReducers<LinksListState>([])(newState, action);
}
