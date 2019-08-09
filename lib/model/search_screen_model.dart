import 'package:flutter/widgets.dart';
import 'package:owmflutter/utils/owm_settings.dart';

class SearchScreenModel extends ChangeNotifier {
  String _query = "";

  final OWMSettings settings;

  SearchScreenModel({this.settings});

  String get query => _query;

  void setQuery(String query) {
    _query = query;
    settings.searchHistory = settings.searchHistory..add(query);
    notifyListeners();
  }
}