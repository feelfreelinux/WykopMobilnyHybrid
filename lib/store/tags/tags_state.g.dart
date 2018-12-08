// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_state.dart';

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

Serializer<TagsState> _$tagsStateSerializer = new _$TagsStateSerializer();
Serializer<TagState> _$tagStateSerializer = new _$TagStateSerializer();

class _$TagsStateSerializer implements StructuredSerializer<TagsState> {
  @override
  final Iterable<Type> types = const [TagsState, _$TagsState];
  @override
  final String wireName = 'TagsState';

  @override
  Iterable serialize(Serializers serializers, TagsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'states',
      serializers.serialize(object.states,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(TagState)])),
    ];

    return result;
  }

  @override
  TagsState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'states':
          result.states.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(TagState)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$TagStateSerializer implements StructuredSerializer<TagState> {
  @override
  final Iterable<Type> types = const [TagState, _$TagState];
  @override
  final String wireName = 'TagState';

  @override
  Iterable serialize(Serializers serializers, TagState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'indexState',
      serializers.serialize(object.indexState,
          specifiedType: const FullType(ItemListState)),
      'entriesState',
      serializers.serialize(object.entriesState,
          specifiedType: const FullType(ItemListState)),
      'linksState',
      serializers.serialize(object.linksState,
          specifiedType: const FullType(ItemListState)),
    ];

    return result;
  }

  @override
  TagState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'indexState':
          result.indexState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'entriesState':
          result.entriesState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'linksState':
          result.linksState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
      }
    }

    return result.build();
  }
}

class _$TagsState extends TagsState {
  @override
  final BuiltMap<String, TagState> states;

  factory _$TagsState([void updates(TagsStateBuilder b)]) =>
      (new TagsStateBuilder()..update(updates)).build();

  _$TagsState._({this.states}) : super._() {
    if (states == null) {
      throw new BuiltValueNullFieldError('TagsState', 'states');
    }
  }

  @override
  TagsState rebuild(void updates(TagsStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TagsStateBuilder toBuilder() => new TagsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagsState && states == other.states;
  }

  @override
  int get hashCode {
    return $jf($jc(0, states.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TagsState')..add('states', states))
        .toString();
  }
}

class TagsStateBuilder implements Builder<TagsState, TagsStateBuilder> {
  _$TagsState _$v;

  MapBuilder<String, TagState> _states;
  MapBuilder<String, TagState> get states =>
      _$this._states ??= new MapBuilder<String, TagState>();
  set states(MapBuilder<String, TagState> states) => _$this._states = states;

  TagsStateBuilder();

  TagsStateBuilder get _$this {
    if (_$v != null) {
      _states = _$v.states?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TagsState;
  }

  @override
  void update(void updates(TagsStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TagsState build() {
    _$TagsState _$result;
    try {
      _$result = _$v ?? new _$TagsState._(states: states.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'states';
        states.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TagsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TagState extends TagState {
  @override
  final ItemListState indexState;
  @override
  final ItemListState entriesState;
  @override
  final ItemListState linksState;

  factory _$TagState([void updates(TagStateBuilder b)]) =>
      (new TagStateBuilder()..update(updates)).build();

  _$TagState._({this.indexState, this.entriesState, this.linksState})
      : super._() {
    if (indexState == null) {
      throw new BuiltValueNullFieldError('TagState', 'indexState');
    }
    if (entriesState == null) {
      throw new BuiltValueNullFieldError('TagState', 'entriesState');
    }
    if (linksState == null) {
      throw new BuiltValueNullFieldError('TagState', 'linksState');
    }
  }

  @override
  TagState rebuild(void updates(TagStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TagStateBuilder toBuilder() => new TagStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagState &&
        indexState == other.indexState &&
        entriesState == other.entriesState &&
        linksState == other.linksState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, indexState.hashCode), entriesState.hashCode),
        linksState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TagState')
          ..add('indexState', indexState)
          ..add('entriesState', entriesState)
          ..add('linksState', linksState))
        .toString();
  }
}

class TagStateBuilder implements Builder<TagState, TagStateBuilder> {
  _$TagState _$v;

  ItemListStateBuilder _indexState;
  ItemListStateBuilder get indexState =>
      _$this._indexState ??= new ItemListStateBuilder();
  set indexState(ItemListStateBuilder indexState) =>
      _$this._indexState = indexState;

  ItemListStateBuilder _entriesState;
  ItemListStateBuilder get entriesState =>
      _$this._entriesState ??= new ItemListStateBuilder();
  set entriesState(ItemListStateBuilder entriesState) =>
      _$this._entriesState = entriesState;

  ItemListStateBuilder _linksState;
  ItemListStateBuilder get linksState =>
      _$this._linksState ??= new ItemListStateBuilder();
  set linksState(ItemListStateBuilder linksState) =>
      _$this._linksState = linksState;

  TagStateBuilder();

  TagStateBuilder get _$this {
    if (_$v != null) {
      _indexState = _$v.indexState?.toBuilder();
      _entriesState = _$v.entriesState?.toBuilder();
      _linksState = _$v.linksState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TagState;
  }

  @override
  void update(void updates(TagStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TagState build() {
    _$TagState _$result;
    try {
      _$result = _$v ??
          new _$TagState._(
              indexState: indexState.build(),
              entriesState: entriesState.build(),
              linksState: linksState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'indexState';
        indexState.build();
        _$failedField = 'entriesState';
        entriesState.build();
        _$failedField = 'linksState';
        linksState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TagState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
