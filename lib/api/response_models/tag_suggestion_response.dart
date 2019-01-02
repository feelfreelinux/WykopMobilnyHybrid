import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag_suggestion_response.g.dart';

abstract class TagSuggestionResponse
    implements Built<TagSuggestionResponse, TagSuggestionResponseBuilder> {
  factory TagSuggestionResponse([updates(TagSuggestionResponseBuilder b)]) = _$TagSuggestionResponse;
  String get followers;
  String get tag;

  TagSuggestionResponse._();
  static Serializer<TagSuggestionResponse> get serializer =>
      _$tagSuggestionResponseSerializer;
}
