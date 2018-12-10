import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

/*
  Reducer that directs actions of all search screens into their reducers.
**/
SearchState searchReducer(SearchState state, action) {
  return state.rebuild((b) => b
    ..entriesSearchState.replace(itemListReducer("SEARCH_ENTRIES", state.entriesSearchState, action))
    ..linksSearchState.replace(itemListReducer("SEARCH_LINKS", state.linksSearchState, action)));
}
