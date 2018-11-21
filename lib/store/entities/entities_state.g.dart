// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities_state.dart';

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

Serializer<EntitiesState> _$entitiesStateSerializer =
    new _$EntitiesStateSerializer();

class _$EntitiesStateSerializer implements StructuredSerializer<EntitiesState> {
  @override
  final Iterable<Type> types = const [EntitiesState, _$EntitiesState];
  @override
  final String wireName = 'EntitiesState';

  @override
  Iterable serialize(Serializers serializers, EntitiesState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entries',
      serializers.serialize(object.entries,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(int), const FullType(Entry)])),
      'entryComments',
      serializers.serialize(object.entryComments,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(EntryComment)])),
      'links',
      serializers.serialize(object.links,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(int), const FullType(Link)])),
    ];

    return result;
  }

  @override
  EntitiesState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntitiesStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entries':
          result.entries.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Entry)
              ])) as BuiltMap);
          break;
        case 'entryComments':
          result.entryComments.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(EntryComment)
              ])) as BuiltMap);
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Link)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$EntitiesState extends EntitiesState {
  @override
  final BuiltMap<int, Entry> entries;
  @override
  final BuiltMap<int, EntryComment> entryComments;
  @override
  final BuiltMap<int, Link> links;

  factory _$EntitiesState([void updates(EntitiesStateBuilder b)]) =>
      (new EntitiesStateBuilder()..update(updates)).build();

  _$EntitiesState._({this.entries, this.entryComments, this.links})
      : super._() {
    if (entries == null) {
      throw new BuiltValueNullFieldError('EntitiesState', 'entries');
    }
    if (entryComments == null) {
      throw new BuiltValueNullFieldError('EntitiesState', 'entryComments');
    }
    if (links == null) {
      throw new BuiltValueNullFieldError('EntitiesState', 'links');
    }
  }

  @override
  EntitiesState rebuild(void updates(EntitiesStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntitiesStateBuilder toBuilder() => new EntitiesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntitiesState &&
        entries == other.entries &&
        entryComments == other.entryComments &&
        links == other.links;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, entries.hashCode), entryComments.hashCode), links.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntitiesState')
          ..add('entries', entries)
          ..add('entryComments', entryComments)
          ..add('links', links))
        .toString();
  }
}

class EntitiesStateBuilder
    implements Builder<EntitiesState, EntitiesStateBuilder> {
  _$EntitiesState _$v;

  MapBuilder<int, Entry> _entries;
  MapBuilder<int, Entry> get entries =>
      _$this._entries ??= new MapBuilder<int, Entry>();
  set entries(MapBuilder<int, Entry> entries) => _$this._entries = entries;

  MapBuilder<int, EntryComment> _entryComments;
  MapBuilder<int, EntryComment> get entryComments =>
      _$this._entryComments ??= new MapBuilder<int, EntryComment>();
  set entryComments(MapBuilder<int, EntryComment> entryComments) =>
      _$this._entryComments = entryComments;

  MapBuilder<int, Link> _links;
  MapBuilder<int, Link> get links =>
      _$this._links ??= new MapBuilder<int, Link>();
  set links(MapBuilder<int, Link> links) => _$this._links = links;

  EntitiesStateBuilder();

  EntitiesStateBuilder get _$this {
    if (_$v != null) {
      _entries = _$v.entries?.toBuilder();
      _entryComments = _$v.entryComments?.toBuilder();
      _links = _$v.links?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntitiesState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntitiesState;
  }

  @override
  void update(void updates(EntitiesStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntitiesState build() {
    _$EntitiesState _$result;
    try {
      _$result = _$v ??
          new _$EntitiesState._(
              entries: entries.build(),
              entryComments: entryComments.build(),
              links: links.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entries';
        entries.build();
        _$failedField = 'entryComments';
        entryComments.build();
        _$failedField = 'links';
        links.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntitiesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
