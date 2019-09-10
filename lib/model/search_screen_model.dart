import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:owmflutter/utils/owm_settings.dart';

class SearchScreenModel extends ChangeNotifier {
  String _query = "";

  final OWMSettings settings;

  Timer _hideSuggestionsTimer;

  String get query => _query;

  bool get isEditing => _isEditing;
  bool _submited = false;

  bool _isEditing = false;

  TextEditingController _searchInputController = TextEditingController();

  TextEditingController get searchInputController => _searchInputController;

  SearchScreenModel({this.settings}) {
    _searchInputController.addListener(() {
      print("oke");
      if (_submited) {
        _submited = false;
        return;
      }
      _isEditing = true;
      _hideSuggestionsTimer?.cancel();
      _hideSuggestionsTimer = null;
      _hideSuggestionsTimer = Timer(
        Duration(seconds: 3),
        () {
          if (_isEditing && _searchInputController.text.length > 3) {
            _isEditing = false;
            notifyListeners();
          }
        },
      );
      notifyListeners();
    });
  }

  void setQuery() {
    _isEditing = false;
    notifyListeners();
    print('set queryy');
    _submited = true;
    var q = searchInputController.text;
    if (q.length >= 3) {
      _query = q;
      settings.searchHistory = settings.searchHistory..add(q);
    }
  }

  @override
  void dispose() {
    _hideSuggestionsTimer?.cancel();
    _searchInputController.dispose();
    super.dispose();
  }
}
