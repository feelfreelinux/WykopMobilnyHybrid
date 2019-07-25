// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_suggestion_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthorSuggestionResponse> _$authorSuggestionResponseSerializer =
    new _$AuthorSuggestionResponseSerializer();

class _$AuthorSuggestionResponseSerializer
    implements StructuredSerializer<AuthorSuggestionResponse> {
  @override
  final Iterable<Type> types = const [
    AuthorSuggestionResponse,
    _$AuthorSuggestionResponse
  ];
  @override
  final String wireName = 'AuthorSuggestionResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthorSuggestionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'avatar',
      serializers.serialize(object.avatar,
          specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthorSuggestionResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthorSuggestionResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthorSuggestionResponse extends AuthorSuggestionResponse {
  @override
  final int color;
  @override
  final String avatar;
  @override
  final String login;

  factory _$AuthorSuggestionResponse(
          [void Function(AuthorSuggestionResponseBuilder) updates]) =>
      (new AuthorSuggestionResponseBuilder()..update(updates)).build();

  _$AuthorSuggestionResponse._({this.color, this.avatar, this.login})
      : super._() {
    if (color == null) {
      throw new BuiltValueNullFieldError('AuthorSuggestionResponse', 'color');
    }
    if (avatar == null) {
      throw new BuiltValueNullFieldError('AuthorSuggestionResponse', 'avatar');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('AuthorSuggestionResponse', 'login');
    }
  }

  @override
  AuthorSuggestionResponse rebuild(
          void Function(AuthorSuggestionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorSuggestionResponseBuilder toBuilder() =>
      new AuthorSuggestionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorSuggestionResponse &&
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
    return (newBuiltValueToStringHelper('AuthorSuggestionResponse')
          ..add('color', color)
          ..add('avatar', avatar)
          ..add('login', login))
        .toString();
  }
}

class AuthorSuggestionResponseBuilder
    implements
        Builder<AuthorSuggestionResponse, AuthorSuggestionResponseBuilder> {
  _$AuthorSuggestionResponse _$v;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  AuthorSuggestionResponseBuilder();

  AuthorSuggestionResponseBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _avatar = _$v.avatar;
      _login = _$v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorSuggestionResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthorSuggestionResponse;
  }

  @override
  void update(void Function(AuthorSuggestionResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthorSuggestionResponse build() {
    final _$result = _$v ??
        new _$AuthorSuggestionResponse._(
            color: color, avatar: avatar, login: login);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
