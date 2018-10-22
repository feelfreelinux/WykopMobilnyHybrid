import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'author_response.g.dart';

abstract class AuthorResponse
    implements Built<AuthorResponse, AuthorResponseBuilder> {
  factory AuthorResponse([updates(AuthorResponseBuilder b)]) = _$AuthorResponse;
  num get color;
  String get avatar;
  String get login;

  AuthorResponse._();
  static Serializer<AuthorResponse> get serializer =>
      _$authorResponseSerializer;
}
