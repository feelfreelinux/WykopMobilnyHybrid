import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';

class LoadHotAction {}

class LoadEntry {
  final int entryId;
  LoadEntry({this.entryId});
}

class UpdateEntryAction {
  final Entry entry;
  UpdateEntryAction({this.entry});
}

ThunkAction<AppState> loadHotPeriod(String period) {
  return (Store<AppState> store) async {
    store.dispatch(SetLoading(type: "MIKROBLOG", isLoading: true));
    var results = await api.getHot(store.state.mikroblogState.listState.page);
    store.dispatch(SetPageNumber(
        type: "MIKROBLOG",
        number: store.state.mikroblogState.listState.page + 1));
    store.dispatch(SetLoading(type: "MIKROBLOG", isLoading: false));

    store.dispatch(AddEntitiesAction(entities: results.state));
    if (results.result.length == 0) {
      store
          .dispatch(SetHaveReachedEnd(type: "MIKROBLOG", haveReachedEnd: true));
    }
    if (store.state.mikroblogState.listState.page == 2) {
      store.dispatch(ClearEntries(type: "MIKROBLOG_ENTRIES"));
    }
    store.dispatch(
        AddEntries(entriesIds: results.result, type: "MIKROBLOG_ENTRIES"));
  };
}
