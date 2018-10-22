import 'package:built_value/built_value.dart';
import 'package:owmflutter/api/api.dart';

part 'author.g.dart';

abstract class Author implements Built<Author, AuthorBuilder> {
  int get color;
  String get avatar;
  String get login;

  factory Author.fromResponse({AuthorResponse response}) {
    return _$Author._(
        color: response.color.toInt(),
        avatar: response.avatar,
        login: response.login);
  }

  Author._();
}
