import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class NotificationsApi extends ApiResource {
  NotificationsApi(ApiClient client) : super(client);

  Future<List<Notification>> getHashtagNotifications(int page) async {
    var items = await client
        .request('notifications', 'HashTags', named: {'page': page.toString()});
    return deserializeNotifications(items);
  }

  Future<void> readAllHashNotifs() async {
    await client.request('notifications', 'ReadHashTagsNotifications');
  }

  Future<int> getNotificationsCount() async {
    var items = await client.request('notifications', 'count');

    return items["count"];
  }

  Future<int> getHashNotificationsCount() async {
    var items = await client.request('notifications', 'HashTagscount');

    return items["count"];
  }
  Future<void> readAllDirectedNotifs() async {
    await client.request('notifications', 'ReadDirectedNotifications');
  }

  Future<List<Notification>> getNotifications(int page) async {
    var items = await client.request('notifications', 'Notifications',
        named: {'page': page.toString()});
    return deserializeNotifications(items);
  }
}
