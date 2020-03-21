// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_related_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileRelatedResponse> _$profileRelatedResponseSerializer =
    new _$ProfileRelatedResponseSerializer();

class _$ProfileRelatedResponseSerializer
    implements StructuredSerializer<ProfileRelatedResponse> {
  @override
  final Iterable<Type> types = const [
    ProfileRelatedResponse,
    _$ProfileRelatedResponse
  ];
  @override
  final String wireName = 'ProfileRelatedResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ProfileRelatedResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ProfileRelatedResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileRelatedResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileRelatedResponse extends ProfileRelatedResponse {
  @override
  final int id;
  @override
  final String url;
  @override
  final String title;
  @override
  final int voteCount;

  factory _$ProfileRelatedResponse(
          [void Function(ProfileRelatedResponseBuilder) updates]) =>
      (new ProfileRelatedResponseBuilder()..update(updates)).build();

  _$ProfileRelatedResponse._({this.id, this.url, this.title, this.voteCount})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ProfileRelatedResponse', 'id');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('ProfileRelatedResponse', 'url');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('ProfileRelatedResponse', 'title');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('ProfileRelatedResponse', 'voteCount');
    }
  }

  @override
  ProfileRelatedResponse rebuild(
          void Function(ProfileRelatedResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileRelatedResponseBuilder toBuilder() =>
      new ProfileRelatedResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileRelatedResponse &&
        id == other.id &&
        url == other.url &&
        title == other.title &&
        voteCount == other.voteCount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), url.hashCode), title.hashCode),
        voteCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileRelatedResponse')
          ..add('id', id)
          ..add('url', url)
          ..add('title', title)
          ..add('voteCount', voteCount))
        .toString();
  }
}

class ProfileRelatedResponseBuilder
    implements Builder<ProfileRelatedResponse, ProfileRelatedResponseBuilder> {
  _$ProfileRelatedResponse _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  ProfileRelatedResponseBuilder();

  ProfileRelatedResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _url = _$v.url;
      _title = _$v.title;
      _voteCount = _$v.voteCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileRelatedResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileRelatedResponse;
  }

  @override
  void update(void Function(ProfileRelatedResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileRelatedResponse build() {
    final _$result = _$v ??
        new _$ProfileRelatedResponse._(
            id: id, url: url, title: title, voteCount: voteCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
