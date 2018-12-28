import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:owmflutter/models/models.dart';
import 'dart:async';

class SetAuthorSuggestionsAction {
  final List<AuthorSuggestion> suggestions;
  SetAuthorSuggestionsAction({this.suggestions});
}

ThunkAction<AppState> loadSuggestions(String q, Completer completer) {
  return (Store<AppState> store) async {
    if (q != null) {
      if (q.startsWith("@")) {
        var suggestions = await api.suggest.suggestUsers(q);
        completer.complete();
        store.dispatch(SetAuthorSuggestionsAction(suggestions: suggestions));
      } else {
        // Clear author suggestions when its a tag suggestion
        store.dispatch(SetAuthorSuggestionsAction(suggestions: []));
      }
    } else {
      store.dispatch(SetAuthorSuggestionsAction(suggestions: []));
    }
  };
}
