import 'package:flutter/foundation.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class GroupedTagNotificationsModel extends ChangeNotifier {
  final String tag;
  List<NotificationModel> notifications;

  bool isExpanded = false;
  GroupedTagNotificationsModel({this.tag, this.notifications});

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}

class NotificationListModel extends ListModel<Notification, NotificationModel> {
  final LoadNewItemsCallback<Notification> loadNewNotifications;
  int get unreadNotifsCount => this.items.where((e) => e.isNew).length;
  List<GroupedTagNotificationsModel> _grouppedNotifs = [];

  bool _canGroup = true;

  bool get canGroup => _canGroup;
  List<GroupedTagNotificationsModel> get grouppedNotifications => _grouppedNotifs;

  void updateNotifCount() {
    notifyListeners();
  }

  Future<void> loadGroupedTagNotifs() async {
    var notifCount = await api.notifications.getHashNotificationsCount();

    if (notifCount < 300) {
      _canGroup = true;

      var page = 1;
      List<Notification> lastNotifsResponse;

      // Fetch all new notifs
      var notifs = List<Notification>.from([]);
      do {
        lastNotifsResponse =
            await api.notifications.getHashtagNotifications(page);
        page ++;
        notifs.addAll(lastNotifsResponse.where((e) => e.isNew));
      } while ((lastNotifsResponse ?? []).any((e) => e.isNew));

      // Group notifs by tag
      notifs.forEach((f) {
        if (!_grouppedNotifs.any((e) => e.tag == f.getTag())) {
          _grouppedNotifs
              .add(GroupedTagNotificationsModel(notifications: [], tag: f.getTag()));
        }

        _grouppedNotifs
            .firstWhere(
              (e) => e.tag == f.getTag(),
            )
            .notifications
            .add(
              NotificationModel()..setData(f),
            );
      });

    } else {
      _canGroup = false;
    }
    notifyListeners();
  }

  Future<void> readHashNotifs() async {
    await api.notifications.readAllHashNotifs();
    this.items.forEach((e) => e.markAsRead());
    notifyListeners();
  }

  Future<void> readDirectedNotifs() async {
    await api.notifications.readAllDirectedNotifs();
    this.items.forEach((e) => e.markAsRead());
    notifyListeners();
  }

  NotificationListModel({this.loadNewNotifications})
      : super(
            loadNewItems: loadNewNotifications,
            mapper: (e) => NotificationModel()..setData(e));
}
