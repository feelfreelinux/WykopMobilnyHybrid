import 'package:built_value/built_value.dart';
import 'package:owmflutter/api/api.dart';

part 'author.g.dart';

enum AuthorSex {
  MALE,
  FEMALE,
  OTHER,
}

abstract class Author implements Built<Author, AuthorBuilder> {
  int get color;
  String get avatar;
  String get login;
  AuthorSex get sex;

  factory Author.fromResponse({AuthorResponse response}) {
    return _$Author._(
        color: response.color.toInt(),
        avatar: response.avatar,
        login: response.login,
        sex: response.sex == null
            ? AuthorSex.OTHER
            : (response.sex == "male" ? AuthorSex.MALE : AuthorSex.FEMALE));
  }

  factory Author.fromAuthState({String username, String avatarUrl, int color}) {
    return _$Author._(
        color: color,
        avatar: avatarUrl,
        login: username,
        sex: AuthorSex.OTHER);
  }
  Author._();
}
