// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

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
  final bool loggedIn;

  factory _$AuthState([void updates(AuthStateBuilder b)]) =>
      (new AuthStateBuilder()..update(updates)).build();

  _$AuthState._(
      {this.token, this.login, this.avatarUrl, this.accountKey, this.loggedIn})
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
        loggedIn == other.loggedIn;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, token.hashCode), login.hashCode),
                avatarUrl.hashCode),
            accountKey.hashCode),
        loggedIn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthState')
          ..add('token', token)
          ..add('login', login)
          ..add('avatarUrl', avatarUrl)
          ..add('accountKey', accountKey)
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
            loggedIn: loggedIn);
    replace(_$result);
    return _$result;
  }
}
