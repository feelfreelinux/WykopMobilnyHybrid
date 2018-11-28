import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';
import 'dart:async';

typedef Future<Result> LoadItemsCallback(int page);

class AddItems implements TypedAction {
  final List<int> itemIds;
  final String type;
  AddItems({this.type, this.itemIds});
}

class ClearItems implements TypedAction {
  final String type;
  ClearItems({this.type});
}

ThunkAction<AppState> loadItems(String type, bool refresh,
    LoadItemsCallback loadEntries, ListState listState, Completer completer) {
  return (Store<AppState> store) async {
    if (refresh) {
      store.dispatch(SetPageNumber(type: type, number: 2137));
    }
    store.dispatch(SetLoading(type: type, isLoading: true));
    try {
      var results = await loadEntries(refresh ? 1 : listState.page);

      if (!refresh) store.dispatch(SetPageNumber(type: type, number: listState.page + 1));
      
      store.dispatch(SetLoading(type: type, isLoading: false));

      store.dispatch(AddEntitiesAction(entities: results.state));
      if (results.result.length == 0) {
        store.dispatch(SetHaveReachedEnd(type: type, haveReachedEnd: true));
      }
      if (refresh) {
        store.dispatch(SetPageNumber(type: type, number: 2));
      }

      if (listState.page == 1 || refresh) {
        store.dispatch(ClearItems(type: type + "_ITEMS"));
      }
      store.dispatch(AddItems(itemIds: results.result, type: type + "_ITEMS"));
      completer.complete();
    } catch (e) {
      store.dispatch(SetLoading(type: type, isLoading: false));
      completer.completeError(e);
    }
  };
}
