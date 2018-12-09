import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

Reducer<EntitiesState> entitiesReducer = combineReducers<EntitiesState>(
    [TypedReducer<EntitiesState, AddEntitiesAction>(_addToState)]);

EntitiesState _addToState(EntitiesState state, AddEntitiesAction action) {
  return state.rebuild((b) => b
    ..entries.addAll(action.entities.entries.asMap())
    ..links.addAll(action.entities.links.asMap())
    ..entryComments.addAll(action.entities.entryComments.asMap()));
}
