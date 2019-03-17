import 'package:built_value/built_value.dart';
import 'package:owmflutter/api/api.dart';

part 'author_suggestion.g.dart';

abstract class AuthorSuggestion
    implements Built<AuthorSuggestion, AuthorSuggestionBuilder> {
  int get color;
  String get avatar;
  String get login;

  factory AuthorSuggestion.fromResponse({AuthorSuggestionResponse response}) {
    return _$AuthorSuggestion._(
        color: response.color.toInt(),
        avatar: response.avatar,
        login: response.login);
  }

  AuthorSuggestion._();
}
