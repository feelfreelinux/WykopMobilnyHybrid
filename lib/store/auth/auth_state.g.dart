// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthState> _$authStateSerializer = new _$AuthStateSerializer();

class _$AuthStateSerializer implements StructuredSerializer<AuthState> {
  @override
  final Iterable<Type> types = const [AuthState, _$AuthState];
  @override
  final String wireName = 'AuthState';

  @override
  Iterable serialize(Serializers serializers, AuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatarUrl',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
      'accountKey',
      serializers.serialize(object.accountKey,
          specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'backgroundUrl',
      serializers.serialize(object.backgroundUrl,
          specifiedType: const FullType(String)),
      'loggedIn',
      serializers.serialize(object.loggedIn,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AuthState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarUrl':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accountKey':
          result.accountKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'backgroundUrl':
          result.backgroundUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loggedIn':
          result.loggedIn = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthState extends AuthState {
  @override
  final String token;
  @override
  final String login;
  @override
  final String avatarUrl;
  @override
  final String accountKey;
  @override
  final int color;
  @override
  final String backgroundUrl;
  @override
  final bool loggedIn;

  factory _$AuthState([void updates(AuthStateBuilder b)]) =>
      (new AuthStateBuilder()..update(updates)).build();

  _$AuthState._(
      {this.token,
      this.login,
      this.avatarUrl,
      this.accountKey,
      this.color,
      this.backgroundUrl,
      this.loggedIn})
      : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('AuthState', 'token');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('AuthState', 'login');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('AuthState', 'avatarUrl');
    }
    if (accountKey == null) {
      throw new BuiltValueNullFieldError('AuthState', 'accountKey');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('AuthState', 'color');
    }
    if (backgroundUrl == null) {
      throw new BuiltValueNullFieldError('AuthState', 'backgroundUrl');
    }
    if (loggedIn == null) {
      throw new BuiltValueNullFieldError('AuthState', 'loggedIn');
    }
  }

  @override
  AuthState rebuild(void updates(AuthStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        token == other.token &&
        login == other.login &&
        avatarUrl == other.avatarUrl &&
        accountKey == other.accountKey &&
        color == other.color &&
        backgroundUrl == other.backgroundUrl &&
        loggedIn == other.loggedIn;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, token.hashCode), login.hashCode),
                        avatarUrl.hashCode),
                    accountKey.hashCode),
                color.hashCode),
            backgroundUrl.hashCode),
        loggedIn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthState')
          ..add('token', token)
          ..add('login', login)
          ..add('avatarUrl', avatarUrl)
          ..add('accountKey', accountKey)
          ..add('color', color)
          ..add('backgroundUrl', backgroundUrl)
          ..add('loggedIn', loggedIn))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

  String _accountKey;
  String get accountKey => _$this._accountKey;
  set accountKey(String accountKey) => _$this._accountKey = accountKey;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _backgroundUrl;
  String get backgroundUrl => _$this._backgroundUrl;
  set backgroundUrl(String backgroundUrl) =>
      _$this._backgroundUrl = backgroundUrl;

  bool _loggedIn;
  bool get loggedIn => _$this._loggedIn;
  set loggedIn(bool loggedIn) => _$this._loggedIn = loggedIn;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _login = _$v.login;
      _avatarUrl = _$v.avatarUrl;
      _accountKey = _$v.accountKey;
      _color = _$v.color;
      _backgroundUrl = _$v.backgroundUrl;
      _loggedIn = _$v.loggedIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthState;
  }

  @override
  void update(void updates(AuthStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthState build() {
    final _$result = _$v ??
        new _$AuthState._(
            token: token,
            login: login,
            avatarUrl: avatarUrl,
            accountKey: accountKey,
            color: color,
            backgroundUrl: backgroundUrl,
            loggedIn: loggedIn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
