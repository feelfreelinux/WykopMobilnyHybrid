// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RelatedResponse> _$relatedResponseSerializer =
    new _$RelatedResponseSerializer();

class _$RelatedResponseSerializer
    implements StructuredSerializer<RelatedResponse> {
  @override
  final Iterable<Type> types = const [RelatedResponse, _$RelatedResponse];
  @override
  final String wireName = 'RelatedResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, RelatedResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(AuthorResponse)),
    ];

    return result;
  }

  @override
  RelatedResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RelatedResponseBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$RelatedResponse extends RelatedResponse {
  @override
  final int id;
  @override
  final String title;
  @override
  final String url;
  @override
  final int voteCount;
  @override
  final AuthorResponse author;

  factory _$RelatedResponse([void Function(RelatedResponseBuilder) updates]) =>
      (new RelatedResponseBuilder()..update(updates)).build();

  _$RelatedResponse._(
      {this.id, this.title, this.url, this.voteCount, this.author})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('RelatedResponse', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('RelatedResponse', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('RelatedResponse', 'url');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('RelatedResponse', 'voteCount');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('RelatedResponse', 'author');
    }
  }

  @override
  RelatedResponse rebuild(void Function(RelatedResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RelatedResponseBuilder toBuilder() =>
      new RelatedResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RelatedResponse &&
        id == other.id &&
        title == other.title &&
        url == other.url &&
        voteCount == other.voteCount &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), url.hashCode),
            voteCount.hashCode),
        author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RelatedResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('url', url)
          ..add('voteCount', voteCount)
          ..add('author', author))
        .toString();
  }
}

class RelatedResponseBuilder
    implements Builder<RelatedResponse, RelatedResponseBuilder> {
  _$RelatedResponse _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  RelatedResponseBuilder();

  RelatedResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _url = _$v.url;
      _voteCount = _$v.voteCount;
      _author = _$v.author?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RelatedResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RelatedResponse;
  }

  @override
  void update(void Function(RelatedResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RelatedResponse build() {
    _$RelatedResponse _$result;
    try {
      _$result = _$v ??
          new _$RelatedResponse._(
              id: id,
              title: title,
              url: url,
              voteCount: voteCount,
              author: author.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RelatedResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
