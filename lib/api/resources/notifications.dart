import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class NotificationsApi extends ApiResource {
  NotificationsApi(ApiClient client) : super(client);

  Future<Result> getHashtagNotifications(int page) async {
    var items = await client
        .request('notifications', 'HashTags', named: {'page': page.toString()});
    return normalizeNotificationsResponse(BuiltList.from(
        client.deserializeList(NotificationResponse.serializer, items)));
  }

  Future<Result> getNotifications(int page) async {
    var items = await client.request('notifications', 'Notifications',
        named: {'page': page.toString()});
    return normalizeNotificationsResponse(BuiltList.from(
        client.deserializeList(NotificationResponse.serializer, items)));
  }
}
