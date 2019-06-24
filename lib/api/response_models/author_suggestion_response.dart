import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'author_suggestion_response.g.dart';

abstract class AuthorSuggestionResponse
    implements
        Built<AuthorSuggestionResponse, AuthorSuggestionResponseBuilder> {
  factory AuthorSuggestionResponse(
          [updates(AuthorSuggestionResponseBuilder b)]) =
      _$AuthorSuggestionResponse;
  int get color;
  String get avatar;
  String get login;

  AuthorSuggestionResponse._();
  static Serializer<AuthorSuggestionResponse> get serializer =>
      _$authorSuggestionResponseSerializer;
}
