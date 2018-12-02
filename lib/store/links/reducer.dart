import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

/*
  Reducer that directs actions of all mikroblog screens into their reducers.
**/
LinksState linksReducer(LinksState state, action) {
  return state.rebuild((b) => b
    ..promotedState
        .replace(entriesReducer("PROMOTED", state.promotedState, action)));
}
