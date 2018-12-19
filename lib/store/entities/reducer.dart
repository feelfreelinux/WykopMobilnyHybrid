import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

Reducer<EntitiesState> entitiesReducer = combineReducers<EntitiesState>(
    [TypedReducer<EntitiesState, AddEntitiesAction>(_addToState)]);

EntitiesState _addToState(EntitiesState state, AddEntitiesAction action) {
  return state.rebuild((b) => b
    ..entries.addAll(action.entities.entries.asMap())
    ..links.addAll(action.entities.links.asMap())
    ..linkComments.addAll(action.entities.linkComments.asMap())
    ..notifications.addAll(action.entities.notifications.asMap())
    ..entryComments.addAll(action.entities.entryComments.asMap()));
}
