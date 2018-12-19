import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all search screens into their reducers.
**/
SearchState searchReducer(SearchState state, action) {
  return state.rebuild((b) => b
    ..entriesSearchState.replace(
        itemListReducer("SEARCH_ENTRIES", state.entriesSearchState, action))
    ..linksSearchState.replace(
        itemListReducer("SEARCH_LINKS", state.linksSearchState, action)));
}
