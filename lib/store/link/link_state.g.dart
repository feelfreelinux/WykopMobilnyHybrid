// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinkScreensState> _$linkScreensStateSerializer =
    new _$LinkScreensStateSerializer();
Serializer<LinkScreenState> _$linkScreenStateSerializer =
    new _$LinkScreenStateSerializer();

class _$LinkScreensStateSerializer
    implements StructuredSerializer<LinkScreensState> {
  @override
  final Iterable<Type> types = const [LinkScreensState, _$LinkScreensState];
  @override
  final String wireName = 'LinkScreensState';

  @override
  Iterable serialize(Serializers serializers, LinkScreensState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'states',
      serializers.serialize(object.states,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(LinkScreenState)])),
    ];

    return result;
  }

  @override
  LinkScreensState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkScreensStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'states':
          result.states.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(LinkScreenState)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$LinkScreenStateSerializer
    implements StructuredSerializer<LinkScreenState> {
  @override
  final Iterable<Type> types = const [LinkScreenState, _$LinkScreenState];
  @override
  final String wireName = 'LinkScreenState';

  @override
  Iterable serialize(Serializers serializers, LinkScreenState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ids',
      serializers.serialize(object.ids,
          specifiedType: const FullType(List, const [const FullType(int)])),
      'errorState',
      serializers.serialize(object.errorState,
          specifiedType: const FullType(ErrorState)),
    ];

    return result;
  }

  @override
  LinkScreenState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkScreenStateBuilder();

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
        case 'errorState':
          result.errorState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ErrorState)) as ErrorState);
          break;
      }
    }

    return result.build();
  }
}

class _$LinkScreensState extends LinkScreensState {
  @override
  final BuiltMap<int, LinkScreenState> states;

  factory _$LinkScreensState([void updates(LinkScreensStateBuilder b)]) =>
      (new LinkScreensStateBuilder()..update(updates)).build();

  _$LinkScreensState._({this.states}) : super._() {
    if (states == null) {
      throw new BuiltValueNullFieldError('LinkScreensState', 'states');
    }
  }

  @override
  LinkScreensState rebuild(void updates(LinkScreensStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkScreensStateBuilder toBuilder() =>
      new LinkScreensStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkScreensState && states == other.states;
  }

  @override
  int get hashCode {
    return $jf($jc(0, states.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkScreensState')
          ..add('states', states))
        .toString();
  }
}

class LinkScreensStateBuilder
    implements Builder<LinkScreensState, LinkScreensStateBuilder> {
  _$LinkScreensState _$v;

  MapBuilder<int, LinkScreenState> _states;
  MapBuilder<int, LinkScreenState> get states =>
      _$this._states ??= new MapBuilder<int, LinkScreenState>();
  set states(MapBuilder<int, LinkScreenState> states) =>
      _$this._states = states;

  LinkScreensStateBuilder();

  LinkScreensStateBuilder get _$this {
    if (_$v != null) {
      _states = _$v.states?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkScreensState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinkScreensState;
  }

  @override
  void update(void updates(LinkScreensStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LinkScreensState build() {
    _$LinkScreensState _$result;
    try {
      _$result = _$v ?? new _$LinkScreensState._(states: states.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'states';
        states.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinkScreensState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LinkScreenState extends LinkScreenState {
  @override
  final List<int> ids;
  @override
  final ErrorState errorState;

  factory _$LinkScreenState([void updates(LinkScreenStateBuilder b)]) =>
      (new LinkScreenStateBuilder()..update(updates)).build();

  _$LinkScreenState._({this.ids, this.errorState}) : super._() {
    if (ids == null) {
      throw new BuiltValueNullFieldError('LinkScreenState', 'ids');
    }
    if (errorState == null) {
      throw new BuiltValueNullFieldError('LinkScreenState', 'errorState');
    }
  }

  @override
  LinkScreenState rebuild(void updates(LinkScreenStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkScreenStateBuilder toBuilder() =>
      new LinkScreenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkScreenState &&
        ids == other.ids &&
        errorState == other.errorState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, ids.hashCode), errorState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkScreenState')
          ..add('ids', ids)
          ..add('errorState', errorState))
        .toString();
  }
}

class LinkScreenStateBuilder
    implements Builder<LinkScreenState, LinkScreenStateBuilder> {
  _$LinkScreenState _$v;

  List<int> _ids;
  List<int> get ids => _$this._ids;
  set ids(List<int> ids) => _$this._ids = ids;

  ErrorStateBuilder _errorState;
  ErrorStateBuilder get errorState =>
      _$this._errorState ??= new ErrorStateBuilder();
  set errorState(ErrorStateBuilder errorState) =>
      _$this._errorState = errorState;

  LinkScreenStateBuilder();

  LinkScreenStateBuilder get _$this {
    if (_$v != null) {
      _ids = _$v.ids;
      _errorState = _$v.errorState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkScreenState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinkScreenState;
  }

  @override
  void update(void updates(LinkScreenStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LinkScreenState build() {
    _$LinkScreenState _$result;
    try {
      _$result = _$v ??
          new _$LinkScreenState._(ids: ids, errorState: errorState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'errorState';
        errorState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinkScreenState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
