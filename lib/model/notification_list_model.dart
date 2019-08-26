import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class NotificationListModel extends ListModel<Notification, NotificationModel> {
  final LoadNewItemsCallback<Notification> loadNewNotifications;

  NotificationListModel({this.loadNewNotifications})
      : super(
            loadNewItems: loadNewNotifications,
            mapper: (e) => NotificationModel()..setData(e));
}
