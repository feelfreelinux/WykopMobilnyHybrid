// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthorResponse> _$authorResponseSerializer =
    new _$AuthorResponseSerializer();

class _$AuthorResponseSerializer
    implements StructuredSerializer<AuthorResponse> {
  @override
  final Iterable<Type> types = const [AuthorResponse, _$AuthorResponse];
  @override
  final String wireName = 'AuthorResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthorResponse object,
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
    if (object.sex != null) {
      result
        ..add('sex')
        ..add(serializers.serialize(object.sex,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthorResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthorResponseBuilder();

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
        case 'sex':
          result.sex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthorResponse extends AuthorResponse {
  @override
  final int color;
  @override
  final String avatar;
  @override
  final String login;
  @override
  final String sex;

  factory _$AuthorResponse([void Function(AuthorResponseBuilder) updates]) =>
      (new AuthorResponseBuilder()..update(updates)).build();

  _$AuthorResponse._({this.color, this.avatar, this.login, this.sex})
      : super._() {
    if (color == null) {
      throw new BuiltValueNullFieldError('AuthorResponse', 'color');
    }
    if (avatar == null) {
      throw new BuiltValueNullFieldError('AuthorResponse', 'avatar');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('AuthorResponse', 'login');
    }
  }

  @override
  AuthorResponse rebuild(void Function(AuthorResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorResponseBuilder toBuilder() =>
      new AuthorResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorResponse &&
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
    return (newBuiltValueToStringHelper('AuthorResponse')
          ..add('color', color)
          ..add('avatar', avatar)
          ..add('login', login)
          ..add('sex', sex))
        .toString();
  }
}

class AuthorResponseBuilder
    implements Builder<AuthorResponse, AuthorResponseBuilder> {
  _$AuthorResponse _$v;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _sex;
  String get sex => _$this._sex;
  set sex(String sex) => _$this._sex = sex;

  AuthorResponseBuilder();

  AuthorResponseBuilder get _$this {
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
  void replace(AuthorResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthorResponse;
  }

  @override
  void update(void Function(AuthorResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthorResponse build() {
    final _$result = _$v ??
        new _$AuthorResponse._(
            color: color, avatar: avatar, login: login, sex: sex);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
