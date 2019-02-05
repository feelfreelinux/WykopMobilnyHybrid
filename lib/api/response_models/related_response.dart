import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'related_response.g.dart';

abstract class RelatedResponse
    implements Built<RelatedResponse, RelatedResponseBuilder> {
  factory RelatedResponse([updates(RelatedResponseBuilder b)]) = _$RelatedResponse;
  int get id;
  String get title;

  String get url;

  @BuiltValueField(wireName: "vote_count")
  int get voteCount;

  AuthorResponse get author;

  RelatedResponse._();
  static Serializer<RelatedResponse> get serializer => _$relatedResponseSerializer;
}
