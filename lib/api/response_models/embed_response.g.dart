// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EmbedResponse> _$embedResponseSerializer =
    new _$EmbedResponseSerializer();

class _$EmbedResponseSerializer implements StructuredSerializer<EmbedResponse> {
  @override
  final Iterable<Type> types = const [EmbedResponse, _$EmbedResponse];
  @override
  final String wireName = 'EmbedResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, EmbedResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'preview',
      serializers.serialize(object.preview,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'animated',
      serializers.serialize(object.animated,
          specifiedType: const FullType(bool)),
    ];
    if (object.source != null) {
      result
        ..add('source')
        ..add(serializers.serialize(object.source,
            specifiedType: const FullType(String)));
    }
    if (object.size != null) {
      result
        ..add('size')
        ..add(serializers.serialize(object.size,
            specifiedType: const FullType(String)));
    }
    if (object.ratio != null) {
      result
        ..add('ratio')
        ..add(serializers.serialize(object.ratio,
            specifiedType: const FullType(double)));
    }
    if (object.plus18 != null) {
      result
        ..add('plus18')
        ..add(serializers.serialize(object.plus18,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  EmbedResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ratio':
          result.ratio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'animated':
          result.animated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'plus18':
          result.plus18 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
  @override
  final String type;
  @override
  final String source;
  @override
  final String size;
  @override
  final double ratio;
  @override
  final bool animated;
  @override
  final bool plus18;

  factory _$EmbedResponse([void Function(EmbedResponseBuilder) updates]) =>
      (new EmbedResponseBuilder()..update(updates)).build();

  _$EmbedResponse._(
      {this.url,
      this.preview,
      this.type,
      this.source,
      this.size,
      this.ratio,
      this.animated,
      this.plus18})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('EmbedResponse', 'url');
    }
    if (preview == null) {
      throw new BuiltValueNullFieldError('EmbedResponse', 'preview');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('EmbedResponse', 'type');
    }
    if (animated == null) {
      throw new BuiltValueNullFieldError('EmbedResponse', 'animated');
    }
  }

  @override
  EmbedResponse rebuild(void Function(EmbedResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmbedResponseBuilder toBuilder() => new EmbedResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmbedResponse &&
        url == other.url &&
        preview == other.preview &&
        type == other.type &&
        source == other.source &&
        size == other.size &&
        ratio == other.ratio &&
        animated == other.animated &&
        plus18 == other.plus18;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, url.hashCode), preview.hashCode),
                            type.hashCode),
                        source.hashCode),
                    size.hashCode),
                ratio.hashCode),
            animated.hashCode),
        plus18.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EmbedResponse')
          ..add('url', url)
          ..add('preview', preview)
          ..add('type', type)
          ..add('source', source)
          ..add('size', size)
          ..add('ratio', ratio)
          ..add('animated', animated)
          ..add('plus18', plus18))
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

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _source;
  String get source => _$this._source;
  set source(String source) => _$this._source = source;

  String _size;
  String get size => _$this._size;
  set size(String size) => _$this._size = size;

  double _ratio;
  double get ratio => _$this._ratio;
  set ratio(double ratio) => _$this._ratio = ratio;

  bool _animated;
  bool get animated => _$this._animated;
  set animated(bool animated) => _$this._animated = animated;

  bool _plus18;
  bool get plus18 => _$this._plus18;
  set plus18(bool plus18) => _$this._plus18 = plus18;

  EmbedResponseBuilder();

  EmbedResponseBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _preview = _$v.preview;
      _type = _$v.type;
      _source = _$v.source;
      _size = _$v.size;
      _ratio = _$v.ratio;
      _animated = _$v.animated;
      _plus18 = _$v.plus18;
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
  void update(void Function(EmbedResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EmbedResponse build() {
    final _$result = _$v ??
        new _$EmbedResponse._(
            url: url,
            preview: preview,
            type: type,
            source: source,
            size: size,
            ratio: ratio,
            animated: animated,
            plus18: plus18);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
