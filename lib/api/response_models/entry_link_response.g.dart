// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_link_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntryLinkResponse> _$entryLinkResponseSerializer =
    new _$EntryLinkResponseSerializer();

class _$EntryLinkResponseSerializer
    implements StructuredSerializer<EntryLinkResponse> {
  @override
  final Iterable<Type> types = const [EntryLinkResponse, _$EntryLinkResponse];
  @override
  final String wireName = 'EntryLinkResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, EntryLinkResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.link != null) {
      result
        ..add('link')
        ..add(serializers.serialize(object.link,
            specifiedType: const FullType(LinkResponse)));
    }
    if (object.entry != null) {
      result
        ..add('entry')
        ..add(serializers.serialize(object.entry,
            specifiedType: const FullType(EntryResponse)));
    }
    return result;
  }

  @override
  EntryLinkResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryLinkResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'link':
          result.link.replace(serializers.deserialize(value,
              specifiedType: const FullType(LinkResponse)) as LinkResponse);
          break;
        case 'entry':
          result.entry.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntryResponse)) as EntryResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryLinkResponse extends EntryLinkResponse {
  @override
  final LinkResponse link;
  @override
  final EntryResponse entry;

  factory _$EntryLinkResponse(
          [void Function(EntryLinkResponseBuilder) updates]) =>
      (new EntryLinkResponseBuilder()..update(updates)).build();

  _$EntryLinkResponse._({this.link, this.entry}) : super._();

  @override
  EntryLinkResponse rebuild(void Function(EntryLinkResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryLinkResponseBuilder toBuilder() =>
      new EntryLinkResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryLinkResponse &&
        link == other.link &&
        entry == other.entry;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, link.hashCode), entry.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryLinkResponse')
          ..add('link', link)
          ..add('entry', entry))
        .toString();
  }
}

class EntryLinkResponseBuilder
    implements Builder<EntryLinkResponse, EntryLinkResponseBuilder> {
  _$EntryLinkResponse _$v;

  LinkResponseBuilder _link;
  LinkResponseBuilder get link => _$this._link ??= new LinkResponseBuilder();
  set link(LinkResponseBuilder link) => _$this._link = link;

  EntryResponseBuilder _entry;
  EntryResponseBuilder get entry =>
      _$this._entry ??= new EntryResponseBuilder();
  set entry(EntryResponseBuilder entry) => _$this._entry = entry;

  EntryLinkResponseBuilder();

  EntryLinkResponseBuilder get _$this {
    if (_$v != null) {
      _link = _$v.link?.toBuilder();
      _entry = _$v.entry?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryLinkResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryLinkResponse;
  }

  @override
  void update(void Function(EntryLinkResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryLinkResponse build() {
    _$EntryLinkResponse _$result;
    try {
      _$result = _$v ??
          new _$EntryLinkResponse._(
              link: _link?.build(), entry: _entry?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'link';
        _link?.build();
        _$failedField = 'entry';
        _entry?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryLinkResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
