// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_suggestion.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthorSuggestion extends AuthorSuggestion {
  @override
  final int color;
  @override
  final String avatar;
  @override
  final String login;

  factory _$AuthorSuggestion(
          [void Function(AuthorSuggestionBuilder) updates]) =>
      (new AuthorSuggestionBuilder()..update(updates)).build();

  _$AuthorSuggestion._({this.color, this.avatar, this.login}) : super._() {
    if (color == null) {
      throw new BuiltValueNullFieldError('AuthorSuggestion', 'color');
    }
    if (avatar == null) {
      throw new BuiltValueNullFieldError('AuthorSuggestion', 'avatar');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('AuthorSuggestion', 'login');
    }
  }

  @override
  AuthorSuggestion rebuild(void Function(AuthorSuggestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorSuggestionBuilder toBuilder() =>
      new AuthorSuggestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorSuggestion &&
        color == other.color &&
        avatar == other.avatar &&
        login == other.login;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, color.hashCode), avatar.hashCode), login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthorSuggestion')
          ..add('color', color)
          ..add('avatar', avatar)
          ..add('login', login))
        .toString();
  }
}

class AuthorSuggestionBuilder
    implements Builder<AuthorSuggestion, AuthorSuggestionBuilder> {
  _$AuthorSuggestion _$v;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  AuthorSuggestionBuilder();

  AuthorSuggestionBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _avatar = _$v.avatar;
      _login = _$v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorSuggestion other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthorSuggestion;
  }

  @override
  void update(void Function(AuthorSuggestionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthorSuggestion build() {
    final _$result = _$v ??
        new _$AuthorSuggestion._(color: color, avatar: avatar, login: login);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
