import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';

typedef Future<List<Notification>> LoadNewNotifications(int page);

class NotificationListModel extends ChangeNotifier {
  final LoadNewNotifications loadNewNotifications;

  NotificationListModel({this.loadNewNotifications}) {
    loadMoreNotifications();
  }

  List<Notification> _notifications = [];
  bool _haveReachedEnd = false;
  bool _isLoading = false;
  int _page = 1;

  List<Notification> get notifications => _notifications;
  bool get haveReachedEnd => _haveReachedEnd;
  bool get isLoading => _isLoading && _page == 1;

  Future<void> refresh() async {
    _page = 1;
    _isLoading = true;
    notifyListeners();
    _notifications = await loadNewNotifications(_page);
    if (_notifications.isEmpty) {
      _haveReachedEnd = true;
    }
    _isLoading = false;
    _page += 1;
    notifyListeners();
  }

  Future<void> loadMoreNotifications() async {
    if (!_isLoading && !_haveReachedEnd) {
      _isLoading = true;
      notifyListeners();
      var loadedLinks = await loadNewNotifications(_page);
      _notifications.addAll(loadedLinks);
      if (loadedLinks.isEmpty) {
        _haveReachedEnd = true;
      }
      _isLoading = false;
      _page += 1;
      notifyListeners();
    }
  }
}
