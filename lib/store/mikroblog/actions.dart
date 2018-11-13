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

class SetEntriesAction {
  final BuiltList<Entry> entries;
  SetEntriesAction({this.entries});
}

class AddEntriesAction {
  final BuiltList<Entry> entries;
  AddEntriesAction({this.entries});
}

class SetLoading {
  final bool isLoading;
  SetLoading({this.isLoading});
}

class SetPageNumber {
  final int number;
  SetPageNumber({this.number});
}

class SetHaveReachedEnd {
  final bool haveReachedEnd;
  SetHaveReachedEnd({this.haveReachedEnd});
}

ThunkAction<AppState> loadHotPeriod(String period) {
  return (Store<AppState> store) async {
      store.dispatch(SetLoading(isLoading: true));
      var results = await api.getHot(store.state.mikroblogState.page);
      store
          .dispatch(SetPageNumber(number: store.state.mikroblogState.page + 1));
      store.dispatch(SetLoading(isLoading: false));

      if (results.length == 0) {
        store.dispatch(SetHaveReachedEnd(haveReachedEnd: true));
      }
      if (store.state.mikroblogState.page == 2) {
        store.dispatch(SetEntriesAction(
            entries: BuiltList.from(results.map((el) {
          return Entry.mapFromResponse(el);
        }).toList())));
      } else {
        store.dispatch(AddEntriesAction(
            entries: BuiltList.from(results.map((el) {
          return Entry.mapFromResponse(el);
        }).toList())));
      }

  };
}