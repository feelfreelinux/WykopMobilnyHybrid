// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_response.dart';

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

Serializer<EmbedResponse> _$embedResponseSerializer =
    new _$EmbedResponseSerializer();

class _$EmbedResponseSerializer implements StructuredSerializer<EmbedResponse> {
  @override
  final Iterable<Type> types = const [EmbedResponse, _$EmbedResponse];
  @override
  final String wireName = 'EmbedResponse';

  @override
  Iterable serialize(Serializers serializers, EmbedResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'preview',
      serializers.serialize(object.preview,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EmbedResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmbedResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'preview':
          result.preview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EmbedResponse extends EmbedResponse {
  @override
  final String url;
  @override
  final String preview;

  factory _$EmbedResponse([void updates(EmbedResponseBuilder b)]) =>
      (new EmbedResponseBuilder()..update(updates)).build();

  _$EmbedResponse._({this.url, this.preview}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('EmbedResponse', 'url');
    }
    if (preview == null) {
      throw new BuiltValueNullFieldError('EmbedResponse', 'preview');
    }
  }

  @override
  EmbedResponse rebuild(void updates(EmbedResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EmbedResponseBuilder toBuilder() => new EmbedResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmbedResponse &&
        url == other.url &&
        preview == other.preview;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, url.hashCode), preview.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EmbedResponse')
          ..add('url', url)
          ..add('preview', preview))
        .toString();
  }
}

class EmbedResponseBuilder
    implements Builder<EmbedResponse, EmbedResponseBuilder> {
  _$EmbedResponse _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  EmbedResponseBuilder();

  EmbedResponseBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _preview = _$v.preview;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmbedResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EmbedResponse;
  }

  @override
  void update(void updates(EmbedResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EmbedResponse build() {
    final _$result = _$v ?? new _$EmbedResponse._(url: url, preview: preview);
    replace(_$result);
    return _$result;
  }
}
