// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntryScreensState> _$entryScreensStateSerializer =
    new _$EntryScreensStateSerializer();
Serializer<EntryScreenState> _$entryScreenStateSerializer =
    new _$EntryScreenStateSerializer();

class _$EntryScreensStateSerializer
    implements StructuredSerializer<EntryScreensState> {
  @override
  final Iterable<Type> types = const [EntryScreensState, _$EntryScreensState];
  @override
  final String wireName = 'EntryScreensState';

  @override
  Iterable serialize(Serializers serializers, EntryScreensState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'states',
      serializers.serialize(object.states,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(EntryScreenState)
          ])),
    ];

    return result;
  }

  @override
  EntryScreensState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryScreensStateBuilder();

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
                const FullType(EntryScreenState)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryScreenStateSerializer
    implements StructuredSerializer<EntryScreenState> {
  @override
  final Iterable<Type> types = const [EntryScreenState, _$EntryScreenState];
  @override
  final String wireName = 'EntryScreenState';

  @override
  Iterable serialize(Serializers serializers, EntryScreenState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ids',
      serializers.serialize(object.ids,
          specifiedType: const FullType(List, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  EntryScreenState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryScreenStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'ids':
          result.ids = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(int)]))
              as List<int>;
          break;
      }
    }

    return result.build();
  }
}

class _$EntryScreensState extends EntryScreensState {
  @override
  final BuiltMap<String, EntryScreenState> states;

  factory _$EntryScreensState([void updates(EntryScreensStateBuilder b)]) =>
      (new EntryScreensStateBuilder()..update(updates)).build();

  _$EntryScreensState._({this.states}) : super._() {
    if (states == null) {
      throw new BuiltValueNullFieldError('EntryScreensState', 'states');
    }
  }

  @override
  EntryScreensState rebuild(void updates(EntryScreensStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryScreensStateBuilder toBuilder() =>
      new EntryScreensStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryScreensState && states == other.states;
  }

  @override
  int get hashCode {
    return $jf($jc(0, states.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryScreensState')
          ..add('states', states))
        .toString();
  }
}

class EntryScreensStateBuilder
    implements Builder<EntryScreensState, EntryScreensStateBuilder> {
  _$EntryScreensState _$v;

  MapBuilder<String, EntryScreenState> _states;
  MapBuilder<String, EntryScreenState> get states =>
      _$this._states ??= new MapBuilder<String, EntryScreenState>();
  set states(MapBuilder<String, EntryScreenState> states) =>
      _$this._states = states;

  EntryScreensStateBuilder();

  EntryScreensStateBuilder get _$this {
    if (_$v != null) {
      _states = _$v.states?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryScreensState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryScreensState;
  }

  @override
  void update(void updates(EntryScreensStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryScreensState build() {
    _$EntryScreensState _$result;
    try {
      _$result = _$v ?? new _$EntryScreensState._(states: states.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'states';
        states.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryScreensState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EntryScreenState extends EntryScreenState {
  @override
  final List<int> ids;

  factory _$EntryScreenState([void updates(EntryScreenStateBuilder b)]) =>
      (new EntryScreenStateBuilder()..update(updates)).build();

  _$EntryScreenState._({this.ids}) : super._() {
    if (ids == null) {
      throw new BuiltValueNullFieldError('EntryScreenState', 'ids');
    }
  }

  @override
  EntryScreenState rebuild(void updates(EntryScreenStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryScreenStateBuilder toBuilder() =>
      new EntryScreenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryScreenState && ids == other.ids;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ids.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryScreenState')..add('ids', ids))
        .toString();
  }
}

class EntryScreenStateBuilder
    implements Builder<EntryScreenState, EntryScreenStateBuilder> {
  _$EntryScreenState _$v;

  List<int> _ids;
  List<int> get ids => _$this._ids;
  set ids(List<int> ids) => _$this._ids = ids;

  EntryScreenStateBuilder();

  EntryScreenStateBuilder get _$this {
    if (_$v != null) {
      _ids = _$v.ids;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryScreenState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryScreenState;
  }

  @override
  void update(void updates(EntryScreenStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryScreenState build() {
    final _$result = _$v ?? new _$EntryScreenState._(ids: ids);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
