import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

part 'pm_message.g.dart';

abstract class PmMessage
    implements Built<PmMessage, PmMessageBuilder> {
  factory PmMessage([updates(PmMessageBuilder b)]) = _$PmMessage;
  String get date;
  String get body;
  @nullable
  Embed get embed;
  bool get isSentFromUser;
  @nullable
  String get app;

  factory PmMessage.mapFromResponse(PmMessageResponse response) {
    return _$PmMessage._(
      date: response.date,
      embed: response.embed != null
          ? Embed.fromResponse(response: response.embed)
          : null,
      body: response.body,
      isSentFromUser: response.status == "received",
      app: response.app,
    );
  }

  PmMessage._();
  static Serializer<PmMessage> get serializer => _$pmMessageSerializer;
}
