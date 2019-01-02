import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> loadTagIndex(
    String tag, bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        TAG_INDEX_PREFIX + tag,
        refresh,
        (page) => api.tags.getIndex(tag, page),
        store.state.tagsState.states[tag] == null
            ? ListState()
            : store.state.tagsState.states[tag].indexState.listState,
        completer));
  };
}

ThunkAction<AppState> loadTagLinks(
    String tag, bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        TAG_LINKS_PREFIX + tag,
        refresh,
        (page) => api.tags.getLinks(tag, page),
        store.state.tagsState.states[tag] == null
            ? ListState()
            : store.state.tagsState.states[tag].linksState.listState,
        completer));
  };
}

ThunkAction<AppState> loadTagEntries(
    String tag, bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        TAG_ENTRIES_PREFIX + tag,
        refresh,
        (page) => api.tags.getEntries(tag, page),
        store.state.tagsState.states[tag] == null
            ? ListState()
            : store.state.tagsState.states[tag].entriesState.listState,
        completer));
  };
}
