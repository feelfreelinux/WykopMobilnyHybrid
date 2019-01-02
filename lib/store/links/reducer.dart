import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all mikroblog screens into their reducers.
**/
LinksState linksReducer(LinksState state, action) {
  return state.rebuild((b) => b
    ..promotedState
        .replace(itemListReducer(LINKS_PROMOTED, state.promotedState, action)));
}
