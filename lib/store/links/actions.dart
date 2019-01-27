import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'dart:async';

ThunkAction<AppState> loadPromoted(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        LINKS_PROMOTED,
        refresh,
        (page) => api.links.getPromoted(page),
        store.state.linksState.promotedState.listState,
        completer));
  };
}

ThunkAction<AppState> loadLinksFavorite(bool refresh, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(loadItems(
        LINKS_FAVORITE,
        refresh,
        (page) => api.links.getFavorite(page),
        store.state.linksState.favoriteState.listState,
        completer));
  };
}
