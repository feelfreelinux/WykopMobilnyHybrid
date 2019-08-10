// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileResponse> _$profileResponseSerializer =
    new _$ProfileResponseSerializer();

class _$ProfileResponseSerializer
    implements StructuredSerializer<ProfileResponse> {
  @override
  final Iterable<Type> types = const [ProfileResponse, _$ProfileResponse];
  @override
  final String wireName = 'ProfileResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, ProfileResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(int)),
      'sex',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(String)),
      'signup_at',
      serializers.serialize(object.signupAt,
          specifiedType: const FullType(String)),
      'is_blocked',
      serializers.serialize(object.isBlocked,
          specifiedType: const FullType(bool)),
      'is_observed',
      serializers.serialize(object.isObserved,
          specifiedType: const FullType(bool)),
      'background',
      serializers.serialize(object.background,
          specifiedType: const FullType(String)),
      'links_added_count',
      serializers.serialize(object.linksAddedCount,
          specifiedType: const FullType(int)),
      'links_published_count',
      serializers.serialize(object.linksPublishedCount,
          specifiedType: const FullType(int)),
      'rank',
      serializers.serialize(object.rank, specifiedType: const FullType(int)),
      'about',
      serializers.serialize(object.about,
          specifiedType: const FullType(String)),
      'violation_url',
      serializers.serialize(object.violationUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ProfileResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sex':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'signup_at':
          result.signupAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_blocked':
          result.isBlocked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_observed':
          result.isObserved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'background':
          result.background = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'links_added_count':
          result.linksAddedCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'links_published_count':
          result.linksPublishedCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rank':
          result.rank = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'about':
          result.about = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'violation_url':
          result.violationUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileResponse extends ProfileResponse {
  @override
  final String login;
  @override
  final int color;
  @override
  final String voteCount;
  @override
  final String signupAt;
  @override
  final bool isBlocked;
  @override
  final bool isObserved;
  @override
  final String background;
  @override
  final int linksAddedCount;
  @override
  final int linksPublishedCount;
  @override
  final int rank;
  @override
  final String about;
  @override
  final String violationUrl;

  factory _$ProfileResponse([void Function(ProfileResponseBuilder) updates]) =>
      (new ProfileResponseBuilder()..update(updates)).build();

  _$ProfileResponse._(
      {this.login,
      this.color,
      this.voteCount,
      this.signupAt,
      this.isBlocked,
      this.isObserved,
      this.background,
      this.linksAddedCount,
      this.linksPublishedCount,
      this.rank,
      this.about,
      this.violationUrl})
      : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'login');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'color');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'voteCount');
    }
    if (signupAt == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'signupAt');
    }
    if (isBlocked == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'isBlocked');
    }
    if (isObserved == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'isObserved');
    }
    if (background == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'background');
    }
    if (linksAddedCount == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'linksAddedCount');
    }
    if (linksPublishedCount == null) {
      throw new BuiltValueNullFieldError(
          'ProfileResponse', 'linksPublishedCount');
    }
    if (rank == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'rank');
    }
    if (about == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'about');
    }
    if (violationUrl == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'violationUrl');
    }
  }

  @override
  ProfileResponse rebuild(void Function(ProfileResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileResponseBuilder toBuilder() =>
      new ProfileResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileResponse &&
        login == other.login &&
        color == other.color &&
        voteCount == other.voteCount &&
        signupAt == other.signupAt &&
        isBlocked == other.isBlocked &&
        isObserved == other.isObserved &&
        background == other.background &&
        linksAddedCount == other.linksAddedCount &&
        linksPublishedCount == other.linksPublishedCount &&
        rank == other.rank &&
        about == other.about &&
        violationUrl == other.violationUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, login.hashCode),
                                                color.hashCode),
                                            voteCount.hashCode),
                                        signupAt.hashCode),
                                    isBlocked.hashCode),
                                isObserved.hashCode),
                            background.hashCode),
                        linksAddedCount.hashCode),
                    linksPublishedCount.hashCode),
                rank.hashCode),
            about.hashCode),
        violationUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileResponse')
          ..add('login', login)
          ..add('color', color)
          ..add('voteCount', voteCount)
          ..add('signupAt', signupAt)
          ..add('isBlocked', isBlocked)
          ..add('isObserved', isObserved)
          ..add('background', background)
          ..add('linksAddedCount', linksAddedCount)
          ..add('linksPublishedCount', linksPublishedCount)
          ..add('rank', rank)
          ..add('about', about)
          ..add('violationUrl', violationUrl))
        .toString();
  }
}

class ProfileResponseBuilder
    implements Builder<ProfileResponse, ProfileResponseBuilder> {
  _$ProfileResponse _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  int _color;
  int get color => _$this._color;
  set color(int color) => _$this._color = color;

  String _voteCount;
  String get voteCount => _$this._voteCount;
  set voteCount(String voteCount) => _$this._voteCount = voteCount;

  String _signupAt;
  String get signupAt => _$this._signupAt;
  set signupAt(String signupAt) => _$this._signupAt = signupAt;

  bool _isBlocked;
  bool get isBlocked => _$this._isBlocked;
  set isBlocked(bool isBlocked) => _$this._isBlocked = isBlocked;

  bool _isObserved;
  bool get isObserved => _$this._isObserved;
  set isObserved(bool isObserved) => _$this._isObserved = isObserved;

  String _background;
  String get background => _$this._background;
  set background(String background) => _$this._background = background;

  int _linksAddedCount;
  int get linksAddedCount => _$this._linksAddedCount;
  set linksAddedCount(int linksAddedCount) =>
      _$this._linksAddedCount = linksAddedCount;

  int _linksPublishedCount;
  int get linksPublishedCount => _$this._linksPublishedCount;
  set linksPublishedCount(int linksPublishedCount) =>
      _$this._linksPublishedCount = linksPublishedCount;

  int _rank;
  int get rank => _$this._rank;
  set rank(int rank) => _$this._rank = rank;

  String _about;
  String get about => _$this._about;
  set about(String about) => _$this._about = about;

  String _violationUrl;
  String get violationUrl => _$this._violationUrl;
  set violationUrl(String violationUrl) => _$this._violationUrl = violationUrl;

  ProfileResponseBuilder();

  ProfileResponseBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _color = _$v.color;
      _voteCount = _$v.voteCount;
      _signupAt = _$v.signupAt;
      _isBlocked = _$v.isBlocked;
      _isObserved = _$v.isObserved;
      _background = _$v.background;
      _linksAddedCount = _$v.linksAddedCount;
      _linksPublishedCount = _$v.linksPublishedCount;
      _rank = _$v.rank;
      _about = _$v.about;
      _violationUrl = _$v.violationUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileResponse;
  }

  @override
  void update(void Function(ProfileResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileResponse build() {
    final _$result = _$v ??
        new _$ProfileResponse._(
            login: login,
            color: color,
            voteCount: voteCount,
            signupAt: signupAt,
            isBlocked: isBlocked,
            isObserved: isObserved,
            background: background,
            linksAddedCount: linksAddedCount,
            linksPublishedCount: linksPublishedCount,
            rank: rank,
            about: about,
            violationUrl: violationUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
