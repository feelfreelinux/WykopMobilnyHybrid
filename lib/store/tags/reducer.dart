import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

/*
  Reducer that directs actions of all tags screens into their reducers.
**/
TagsState tagReducer(TagsState state, action) {
  if (action is TypedAction && action.type.startsWith("TAG_")) {
    var tag = action.type.split('_')[1];
    var newState =
        state.rebuild((b) => b..states.putIfAbsent(tag, () => TagState()));
    return newState.rebuild((e) => e
      ..states.updateValue(
          tag,
          (tagState) => tagState.rebuild(
                (k) => k
                  ..indexState.replace(entriesReducer("TAG_" + tag + "_INDEX",
                      newState.states[tag].indexState, action))
                  ..entriesState.replace(entriesReducer(
                      "TAG_" + tag + "_ENTRIES",
                      newState.states[tag].entriesState,
                      action))
                  ..linksState.replace(entriesReducer("TAG_" + tag + "_LINKS",
                      newState.states[tag].linksState, action)),
              )));
  } else {
    return state;
  }
}
