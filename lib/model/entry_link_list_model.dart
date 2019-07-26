import 'package:flutter/foundation.dart';
import 'package:owmflutter/api/response_models/entry_link_response.dart';
import 'package:owmflutter/models/models.dart';

typedef Future<List<EntryLink>> LoadNewEntryLinks(int page);

class EntryLinkListModel extends ChangeNotifier {
  final LoadNewEntryLinks loadEntryLinks;

  EntryLinkListModel({this.loadEntryLinks}) {
    loadMoreEntryLinks();
  }

  List<EntryLink> _entryLinks = [];
  bool _haveReachedEnd = false;
  bool _isLoading = false;
  int _page = 1;

  List<EntryLink> get entryLinks => _entryLinks;
  bool get haveReachedEnd => _haveReachedEnd;
  bool get isLoading => _isLoading  && _page == 1;

  Future<void> refresh() async {
    _page = 1;
    _isLoading = true;
    notifyListeners();
    _entryLinks = await loadEntryLinks(_page);
    if (_entryLinks.isEmpty) {
      _haveReachedEnd = true;
    }
    _isLoading = false;
    _page += 1;
    notifyListeners();
  }

  Future<void> loadMoreEntryLinks() async {
    if (!_isLoading && !_haveReachedEnd) {
      _isLoading = true;
      notifyListeners();
      var loadedLinks = await loadEntryLinks(_page);
      _entryLinks.addAll(loadedLinks);
      if (loadedLinks.isEmpty) {
        _haveReachedEnd = true;
      }
      _isLoading = false;
      _page += 1;
      notifyListeners();
    }
  }
}
