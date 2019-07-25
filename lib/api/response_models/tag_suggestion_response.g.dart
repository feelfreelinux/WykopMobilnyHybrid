// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_suggestion_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TagSuggestionResponse> _$tagSuggestionResponseSerializer =
    new _$TagSuggestionResponseSerializer();

class _$TagSuggestionResponseSerializer
    implements StructuredSerializer<TagSuggestionResponse> {
  @override
  final Iterable<Type> types = const [
    TagSuggestionResponse,
    _$TagSuggestionResponse
  ];
  @override
  final String wireName = 'TagSuggestionResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TagSuggestionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'followers',
      serializers.serialize(object.followers,
          specifiedType: const FullType(String)),
      'tag',
      serializers.serialize(object.tag, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TagSuggestionResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagSuggestionResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'followers':
          result.followers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tag':
          result.tag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TagSuggestionResponse extends TagSuggestionResponse {
  @override
  final String followers;
  @override
  final String tag;

  factory _$TagSuggestionResponse(
          [void Function(TagSuggestionResponseBuilder) updates]) =>
      (new TagSuggestionResponseBuilder()..update(updates)).build();

  _$TagSuggestionResponse._({this.followers, this.tag}) : super._() {
    if (followers == null) {
      throw new BuiltValueNullFieldError('TagSuggestionResponse', 'followers');
    }
    if (tag == null) {
      throw new BuiltValueNullFieldError('TagSuggestionResponse', 'tag');
    }
  }

  @override
  TagSuggestionResponse rebuild(
          void Function(TagSuggestionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagSuggestionResponseBuilder toBuilder() =>
      new TagSuggestionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagSuggestionResponse &&
        followers == other.followers &&
        tag == other.tag;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, followers.hashCode), tag.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TagSuggestionResponse')
          ..add('followers', followers)
          ..add('tag', tag))
        .toString();
  }
}

class TagSuggestionResponseBuilder
    implements Builder<TagSuggestionResponse, TagSuggestionResponseBuilder> {
  _$TagSuggestionResponse _$v;

  String _followers;
  String get followers => _$this._followers;
  set followers(String followers) => _$this._followers = followers;

  String _tag;
  String get tag => _$this._tag;
  set tag(String tag) => _$this._tag = tag;

  TagSuggestionResponseBuilder();

  TagSuggestionResponseBuilder get _$this {
    if (_$v != null) {
      _followers = _$v.followers;
      _tag = _$v.tag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagSuggestionResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TagSuggestionResponse;
  }

  @override
  void update(void Function(TagSuggestionResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TagSuggestionResponse build() {
    final _$result =
        _$v ?? new _$TagSuggestionResponse._(followers: followers, tag: tag);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
