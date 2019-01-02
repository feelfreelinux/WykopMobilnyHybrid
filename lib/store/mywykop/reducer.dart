import 'package:owmflutter/store/store.dart';

/*
  Reducer that directs actions of all mywykop screens into their reducers.
**/
MyWykopState myWykopReducer(MyWykopState state, action) {
  return state.rebuild((b) => b
    ..indexState
        .replace(itemListReducer(MYWYKOP_INDEX, state.indexState, action)));
}
