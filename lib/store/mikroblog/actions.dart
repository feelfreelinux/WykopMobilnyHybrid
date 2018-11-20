import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:redux/redux.dart';

ThunkAction<AppState> loadHot6() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("HOT6", (page) => api.entries.getHot(page, "6"),
        store.state.mikroblogState.hot6State.listState));
  };
}

ThunkAction<AppState> loadHot12() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries(
        "HOT12",
        (page) => api.entries.getHot(page, "12"),
        store.state.mikroblogState.hot12State.listState));
  };
}

ThunkAction<AppState> loadHot24() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries(
        "HOT24",
        (page) => api.entries.getHot(page, "24"),
        store.state.mikroblogState.hot24State.listState));
  };
}

ThunkAction<AppState> loadNewest() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("NEWEST", (page) => api.entries.getNewest(page),
        store.state.mikroblogState.newestState.listState));
  };
}

ThunkAction<AppState> loadActive() {
  return (Store<AppState> store) async {
    store.dispatch(loadEntries("ACTIVE", (page) => api.entries.getActive(page),
        store.state.mikroblogState.activeState.listState));
  };
}
