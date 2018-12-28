import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

Reducer<SuggestionsState> suggestionsReducer = combineReducers<SuggestionsState>([
  TypedReducer<SuggestionsState, SetAuthorSuggestionsAction>(_setAuthorsSuggestions)
]);

SuggestionsState _setAuthorsSuggestions(
    SuggestionsState state, SetAuthorSuggestionsAction action) {
  return state.rebuild((b) => b
    ..authorSuggestions.clear()
    ..authorSuggestions.addAll(action.suggestions));
}