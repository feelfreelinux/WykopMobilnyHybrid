import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'notification_response.g.dart';

abstract class NotificationResponse
    implements Built<NotificationResponse, NotificationResponseBuilder> {
  factory NotificationResponse([updates(NotificationResponseBuilder b)]) =
      _$NotificationResponse;
  int get id;

  String get date;

  @nullable
  String get body;

  @nullable
  @BuiltValueField(wireName: 'item_id')
  String get itemId;

  @nullable
  String get url;

  String get type;

  @nullable
  @BuiltValueField(wireName: 'new')
  bool get isNew;

  AuthorResponse get author;

  NotificationResponse._();
  static Serializer<NotificationResponse> get serializer =>
      _$notificationResponseSerializer;
}
