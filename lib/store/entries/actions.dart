import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';

typedef Future<Result> LoadEntriesCallback(int page);

class AddEntries implements TypedAction {
  final List<int> entriesIds;
  final String type;
  AddEntries({this.type, this.entriesIds});
}

class ClearEntries implements TypedAction {
  final String type;
  ClearEntries({this.type});
}

ThunkAction<AppState> loadEntries(String type, LoadEntriesCallback loadEntries, ListState listState) {
  return (Store<AppState> store) async {
    store.dispatch(SetLoading(type: type, isLoading: true));
    var results = await loadEntries(listState.page);
    store.dispatch(SetPageNumber(
        type: type,
        number: listState.page + 1));
    store.dispatch(SetLoading(type: type, isLoading: false));

    store.dispatch(AddEntitiesAction(entities: results.state));
    if (results.result.length == 0) {
      store
          .dispatch(SetHaveReachedEnd(type: type, haveReachedEnd: true));
    }
    if (listState.page == 1) {
      store.dispatch(ClearEntries(type: type + "_ENTRIES"));
    }
    store.dispatch(
        AddEntries(entriesIds: results.result, type: type + "_ENTRIES"));
  };
}
