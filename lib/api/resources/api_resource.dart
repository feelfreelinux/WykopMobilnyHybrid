import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

abstract class ApiResource {
  ApiClient _client;
  ApiClient get client => _client;

  ApiResource(ApiClient client) {
    this._client = client;
  }

  List<Entry> deserializeEntries(dynamic items) {
    return _client
        .deserializeList(EntryResponse.serializer, items)
        .map((e) => Entry.mapFromResponse(e))
        .toList();
  }

  List<Link> deserializeLinks(dynamic items) {
    return _client
        .deserializeList(LinkResponse.serializer, items)
        .map((e) => Link.mapFromResponse(e))
        .toList();
  }

  List<EntryLink> deserializeEntryLinks(dynamic items) {
    return _client
        .deserializeList(EntryLinkResponse.serializer, items)
        .map((e) => EntryLink.mapFromResponse(e))
        .toList();
  }

  List<Notification> deserializeNotifications(dynamic items) {
    return _client
        .deserializeList(NotificationResponse.serializer, items)
        .map((e) => Notification.mapFromResponse(e))
        .toList();
  }

  List<LinkComment> deserializeLinkComments(dynamic items) {
    return _client
        .deserializeList(LinkCommentResponse.serializer, items)
        .map((e) => LinkComment.mapFromResponse(e))
        .toList();
  }

    List<Related> deserializeRelatedLinks(dynamic items) {
    return _client
        .deserializeList(RelatedResponse.serializer, items)
        .map((e) => Related.mapFromResponse(e))
        .toList();
  }
}
