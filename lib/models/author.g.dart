// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

class _$Author extends Author {
  @override
  final int color;
  @override
  final String avatar;
  @override
  final String login;
  @override
  final AuthorSex sex;

  factory _$Author([void updates(AuthorBuilder b)]) =>
      (new AuthorBuilder()..update(updates)).build();

  _$Author._({this.color, this.avatar, this.login, this.sex}) : super._() {
    if (color == null) {
      throw new BuiltValueNullFieldError('Author', 'color');
    }
    if (avatar == null) {
      throw new BuiltValueNullFieldError('Author', 'avatar');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('Author', 'login');
    }
    if (sex == null) {
      throw new BuiltValueNullFieldError('Author', 'sex');
    }
  }

  @override
  Author rebuild(void updates(AuthorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorBuilder toBuilder() => new AuthorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Author &&
        color == other.color &&
        avatar == other.avatar &&
        login == other.login &&
        sex == other.sex;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, color.hashCode), avatar.hashCode), login.hashCode),
        sex.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Author')
          ..add('color', color)
          ..add('avatar', avatar)
          ..add('login', login)
          ..add('sex', sex))
        .toString();
  }
}

class AuthorBuilder implements Builder<Author, AuthorBuilder> {
  _$Author _$v;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  AuthorSex _sex;
  AuthorSex get sex => _$this._sex;
  set sex(AuthorSex sex) => _$this._sex = sex;

  AuthorBuilder();

  AuthorBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _avatar = _$v.avatar;
      _login = _$v.login;
      _sex = _$v.sex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Author other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Author;
  }

  @override
  void update(void updates(AuthorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Author build() {
    final _$result = _$v ??
        new _$Author._(color: color, avatar: avatar, login: login, sex: sex);
    replace(_$result);
    return _$result;
  }
}
