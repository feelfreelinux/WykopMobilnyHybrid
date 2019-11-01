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
      'signup_at',
      serializers.serialize(object.signupAt,
          specifiedType: const FullType(String)),
      'followers',
      serializers.serialize(object.followers,
          specifiedType: const FullType(int)),
      'links_added_count',
      serializers.serialize(object.linksAddedCount,
          specifiedType: const FullType(int)),
      'links_published_count',
      serializers.serialize(object.linksPublishedCount,
          specifiedType: const FullType(int)),
      'avatar',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
      'rank',
      serializers.serialize(object.rank, specifiedType: const FullType(int)),
    ];
    if (object.sex != null) {
      result
        ..add('sex')
        ..add(serializers.serialize(object.sex,
            specifiedType: const FullType(String)));
    }
    if (object.isBlocked != null) {
      result
        ..add('is_blocked')
        ..add(serializers.serialize(object.isBlocked,
            specifiedType: const FullType(bool)));
    }
    if (object.isObserved != null) {
      result
        ..add('is_observed')
        ..add(serializers.serialize(object.isObserved,
            specifiedType: const FullType(bool)));
    }
    if (object.background != null) {
      result
        ..add('background')
        ..add(serializers.serialize(object.background,
            specifiedType: const FullType(String)));
    }
    if (object.about != null) {
      result
        ..add('about')
        ..add(serializers.serialize(object.about,
            specifiedType: const FullType(String)));
    }
    if (object.violationUrl != null) {
      result
        ..add('violation_url')
        ..add(serializers.serialize(object.violationUrl,
            specifiedType: const FullType(String)));
    }
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
          result.sex = serializers.deserialize(value,
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
        case 'followers':
          result.followers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
        case 'avatar':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
  final String sex;
  @override
  final String signupAt;
  @override
  final bool isBlocked;
  @override
  final int followers;
  @override
  final bool isObserved;
  @override
  final String background;
  @override
  final int linksAddedCount;
  @override
  final int linksPublishedCount;
  @override
  final String avatarUrl;
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
      this.sex,
      this.signupAt,
      this.isBlocked,
      this.followers,
      this.isObserved,
      this.background,
      this.linksAddedCount,
      this.linksPublishedCount,
      this.avatarUrl,
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
    if (signupAt == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'signupAt');
    }
    if (followers == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'followers');
    }
    if (linksAddedCount == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'linksAddedCount');
    }
    if (linksPublishedCount == null) {
      throw new BuiltValueNullFieldError(
          'ProfileResponse', 'linksPublishedCount');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'avatarUrl');
    }
    if (rank == null) {
      throw new BuiltValueNullFieldError('ProfileResponse', 'rank');
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
        sex == other.sex &&
        signupAt == other.signupAt &&
        isBlocked == other.isBlocked &&
        followers == other.followers &&
        isObserved == other.isObserved &&
        background == other.background &&
        linksAddedCount == other.linksAddedCount &&
        linksPublishedCount == other.linksPublishedCount &&
        avatarUrl == other.avatarUrl &&
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
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, login.hashCode),
                                                        color.hashCode),
                                                    sex.hashCode),
                                                signupAt.hashCode),
                                            isBlocked.hashCode),
                                        followers.hashCode),
                                    isObserved.hashCode),
                                background.hashCode),
                            linksAddedCount.hashCode),
                        linksPublishedCount.hashCode),
                    avatarUrl.hashCode),
                rank.hashCode),
            about.hashCode),
        violationUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileResponse')
          ..add('login', login)
          ..add('color', color)
          ..add('sex', sex)
          ..add('signupAt', signupAt)
          ..add('isBlocked', isBlocked)
          ..add('followers', followers)
          ..add('isObserved', isObserved)
          ..add('background', background)
          ..add('linksAddedCount', linksAddedCount)
          ..add('linksPublishedCount', linksPublishedCount)
          ..add('avatarUrl', avatarUrl)
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

  String _sex;
  String get sex => _$this._sex;
  set sex(String sex) => _$this._sex = sex;

  String _signupAt;
  String get signupAt => _$this._signupAt;
  set signupAt(String signupAt) => _$this._signupAt = signupAt;

  bool _isBlocked;
  bool get isBlocked => _$this._isBlocked;
  set isBlocked(bool isBlocked) => _$this._isBlocked = isBlocked;

  int _followers;
  int get followers => _$this._followers;
  set followers(int followers) => _$this._followers = followers;

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

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

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
      _sex = _$v.sex;
      _signupAt = _$v.signupAt;
      _isBlocked = _$v.isBlocked;
      _followers = _$v.followers;
      _isObserved = _$v.isObserved;
      _background = _$v.background;
      _linksAddedCount = _$v.linksAddedCount;
      _linksPublishedCount = _$v.linksPublishedCount;
      _avatarUrl = _$v.avatarUrl;
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
            sex: sex,
            signupAt: signupAt,
            isBlocked: isBlocked,
            followers: followers,
            isObserved: isObserved,
            background: background,
            linksAddedCount: linksAddedCount,
            linksPublishedCount: linksPublishedCount,
            avatarUrl: avatarUrl,
            rank: rank,
            about: about,
            violationUrl: violationUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
