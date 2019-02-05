import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all mikroblog screens into their reducers.
**/
LinksState linksReducer(LinksState state, action) {
  return state.rebuild((b) => b
    ..favoriteState
        .replace(itemListReducer(LINKS_FAVORITE, state.favoriteState, action))
    ..promotedState
        .replace(itemListReducer(LINKS_PROMOTED, state.promotedState, action)));
}
