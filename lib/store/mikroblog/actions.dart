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

ThunkAction<AppState> loadHot6() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("HOT6", (page) => api.getHot(page, "6"), store.state.hot6State.listState));
  };
}

ThunkAction<AppState> loadHot12() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("HOT12", (page) => api.getHot(page, "12"), store.state.hot12State.listState));
  };
}

ThunkAction<AppState> loadHot24() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("HOT24", (page) => api.getHot(page, "24"), store.state.hot24State.listState));
  };
}

ThunkAction<AppState> loadNewest() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("NEWEST", (page) => api.getNewest(page), store.state.newest.listState));
  };
}

ThunkAction<AppState> loadActive() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("ACTIVE", (page) => api.getActive(page), store.state.activeState.listState));
  };
}