import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';

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

ThunkAction<AppState> loadItems(
    String type, LoadItemsCallback loadEntries, ListState listState) {
  return (Store<AppState> store) async {
    store.dispatch(SetLoading(type: type, isLoading: true));
    var results = await loadEntries(listState.page);
    store.dispatch(SetPageNumber(type: type, number: listState.page + 1));
    store.dispatch(SetLoading(type: type, isLoading: false));

    store.dispatch(AddEntitiesAction(entities: results.state));
    if (results.result.length == 0) {
      store.dispatch(SetHaveReachedEnd(type: type, haveReachedEnd: true));
    }
    if (listState.page == 1) {
      store.dispatch(ClearItems(type: type + "_ITEMS"));
    }
    store.dispatch(
        AddItems(itemIds: results.result, type: type + "_ITEMS"));
  };
}
