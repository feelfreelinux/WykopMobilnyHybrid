import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'embed_response.g.dart';

abstract class EmbedResponse
    implements Built<EmbedResponse, EmbedResponseBuilder> {
  factory EmbedResponse([updates(EmbedResponseBuilder b)]) = _$EmbedResponse;
  String get url;
  String get preview;
  String get type;
  bool get animated;
  @nullable
  bool get plus18;

  EmbedResponse._();
  static Serializer<EmbedResponse> get serializer => _$embedResponseSerializer;
}
