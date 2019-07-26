import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';

typedef Future<List<Entry>> LoadNewEntriesCallback(int page);

class EntryListModel extends ChangeNotifier {
  final LoadNewEntriesCallback loadNewEntries;

  EntryListModel({this.loadNewEntries}) {
    loadMoreEntries();
  }

  List<Entry> _entries = [];
  bool _haveReachedEnd = false;
  bool _isLoading = false;
  int _page = 1;

  List<Entry> get entries => _entries;
  bool get haveReachedEnd => _haveReachedEnd;
  bool get isLoading => _isLoading && _page == 1;

  Future<void> refresh() async {
    _page = 1;
    _isLoading = true;
    notifyListeners();
    _entries = await loadNewEntries(_page);
    if (_entries.isEmpty) {
      _haveReachedEnd = true;
    }
    _isLoading = false;
    _page += 1;
    notifyListeners();
  }

  Future<void> loadMoreEntries() async {
    if (!_isLoading && !_haveReachedEnd) {
      _isLoading = true;
      notifyListeners();
      var loadedEntries = await loadNewEntries(_page);
      _entries.addAll(loadedEntries);
      if (loadedEntries.isEmpty) {
        _haveReachedEnd = true;
      }
      _isLoading = false;
      _page += 1;
      notifyListeners();
    }
  }
}
