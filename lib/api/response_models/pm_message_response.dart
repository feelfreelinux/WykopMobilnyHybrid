import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'pm_message_response.g.dart';

abstract class PmMessageResponse
    implements Built<PmMessageResponse,PmMessageResponseBuilder> {
  factory PmMessageResponse([updates(PmMessageResponseBuilder b)]) =
      _$PmMessageResponse;
  int get id;

  String get date;

  @nullable
  String get body;

  @nullable
  String get status;

  String get direction;

  @nullable
  String get app;

  @nullable
  EmbedResponse get embed;
  
  @nullable
  AuthorResponse get author;

  PmMessageResponse._();
  static Serializer<PmMessageResponse> get serializer =>
      _$pmMessageResponseSerializer;
}
