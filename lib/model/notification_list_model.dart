import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class NotificationListModel extends ListModel<Notification, NotificationModel> {
  final LoadNewItemsCallback<Notification> loadNewNotifications;
  int get unreadNotifsCount => this.items.where((e) => e.isNew).length;

  Future<void> readHashNotifs() async {
    await api.notifications.readAllHashNotifs();
    this.items.forEach((e) => e.markAsRead());
  }
  
  Future<void> readDirectedNotifs() async {
    await api.notifications.readAllDirectedNotifs();
    this.items.forEach((e) => e.markAsRead());
  }

  NotificationListModel({this.loadNewNotifications})
      : super(
            loadNewItems: loadNewNotifications,
            mapper: (e) => NotificationModel()..setData(e));
}
