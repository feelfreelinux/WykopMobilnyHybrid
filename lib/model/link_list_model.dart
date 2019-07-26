import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';

typedef Future<List<Link>> LoadNewLinksCallback(int page);

class LinkListModel extends ChangeNotifier {
  final LoadNewLinksCallback loadNewLinks;

  LinkListModel({this.loadNewLinks}) {
    loadMoreLinks();
  }

  List<Link> _links = [];
  bool _haveReachedEnd = false;
  bool _isLoading = false;
  int _page = 1;

  List<Link> get links => _links;
  bool get haveReachedEnd => _haveReachedEnd;
  bool get isLoading => _isLoading  && _page == 1;

  Future<void> refresh() async {
    _page = 1;
    _isLoading = true;
    notifyListeners();
    _links = await loadNewLinks(_page);
    if (_links.isEmpty) {
      _haveReachedEnd = true;
    }
    _isLoading = false;
    _page += 1;
    notifyListeners();
  }

  Future<void> loadMoreLinks() async {
    if (!_isLoading && !_haveReachedEnd) {
      _isLoading = true;
      notifyListeners();
      var loadedLinks = await loadNewLinks(_page);
      _links.addAll(loadedLinks);
      if (loadedLinks.isEmpty) {
        _haveReachedEnd = true;
      }
      _isLoading = false;
      _page += 1;
      notifyListeners();
    }
  }
}
