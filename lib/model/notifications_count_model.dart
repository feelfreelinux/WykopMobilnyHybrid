import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/foundation.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/notifications_handler.dart';

class NotificationsCountModel extends ChangeNotifier {
  int _notificationsCount = 0;

  int get unreadNotificationsCount => _notificationsCount;

  void setUnreadNotificationsCount(int count) {
    _notificationsCount = count;
    notifyListeners();
  }

  Future<void> loadNotifCount() async {
    _notificationsCount = await api.notifications.getNotificationsCount();
    notifyListeners();
  }

  void startBackgroundFetch() {
    BackgroundFetch.configure(
        BackgroundFetchConfig(
            requiredNetworkType: NetworkType.ANY,
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false), () async {
      print('[BackgroundFetch] Event received');
      var count = await fetchNotifications();
      setUnreadNotificationsCount(count);
      BackgroundFetch.finish("owmh");
    }).then((int status) {
      print('[BackgroundFetch] configure success: $status');
    }).catchError((e) {
      print('[BackgroundFetch] configure ERROR: $e');
    });
  }
}
