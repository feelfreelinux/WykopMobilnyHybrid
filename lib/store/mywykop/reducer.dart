import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

/*
  Reducer that directs actions of all mywykop screens into their reducers.
**/
MyWykopState myWykopReducer(MyWykopState state, action) {
  return state.rebuild((b) => b
    ..indexState.replace(entriesReducer("MYWYKOP_INDEX", state.indexState, action)));
}
