import 'package:flutter/foundation.dart';
import 'package:owmflutter/api/api.dart';

class ObservedTagsModel extends ChangeNotifier {
  List<String> _tags = [];
  bool _isLoading = true;

  List<String> get tags => _tags;
  bool get isLoading => _isLoading;

  Future<void> loadObservedTags() async {
    _isLoading = true;
    notifyListeners();
    _tags = await api.tags.getObservedTags();
    _isLoading = false;
    notifyListeners();
  }
}