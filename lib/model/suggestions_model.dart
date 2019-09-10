import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

class SuggestionsModel extends ChangeNotifier {
  List<TagSuggestion> _tagSuggestions = [];
  List<AuthorSuggestion> _authorSuggestions = [];

  List<TagSuggestion> get tagSuggestions => _tagSuggestions;
  List<AuthorSuggestion> get authorSuggestions => _authorSuggestions;

  Future<void> loadSuggestions(String q) async {
    if (q != null) {
      if (q.length > 3 && q.startsWith("@") && verifyAuthorSuggestion(q)) {
        var suggestions = await api.suggest.suggestUsers(q.split("@")[1]);
        _authorSuggestions = suggestions;
        _tagSuggestions = [];
        notifyListeners();
        return;
      } else if (q.length > 3 && q.startsWith("#") && verifyTagSuggestion(q)) {
        var suggestions = await api.suggest.suggestTags(q.split("#")[1]);
        _authorSuggestions = [];
        _tagSuggestions = suggestions;
        notifyListeners();
        return;
      }
    }
    clearSuggestions();
  }

  void clearSuggestions() {
    _tagSuggestions = [];
    _authorSuggestions = [];
    notifyListeners();
  }
}

// TODO: fix this regex
bool verifyAuthorSuggestion(String q) {
  return true;
  var regex = RegExp(r"^[A-Za-z0-9]+(?:[ _][A-Za-z0-9]+)*$");
  return regex.hasMatch(q);
}

// TODO: fix this regex
bool verifyTagSuggestion(String q) {
  return true;
  var regex = RegExp(r"^#\w+$");
  return regex.hasMatch(q);
}
