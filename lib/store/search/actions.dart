import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> searchEntries(
    String query, bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        "SEARCH_ENTRIES",
        refresh,
        (page) => api.search.searchEntries(page, query),
        store.state.searchState.entriesSearchState.listState,
        completer));
  };
}

ThunkAction<AppState> clearEntries() {
  return (Store<AppState> store) async {
    store.dispatch(ClearItems(type: "SEARCH_ENTRIES_ITEMS"));
  };
}

ThunkAction<AppState> searchLinks(
    String query, bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        "SEARCH_LINKS",
        refresh,
        (page) => api.search.searchLinks(page, query),
        store.state.searchState.linksSearchState.listState,
        completer));
  };
}

ThunkAction<AppState> clearLinks() {
  return (Store<AppState> store) async {
    store.dispatch(ClearItems(type: "SEARCH_LINKS_ITEMS"));
  };
}
