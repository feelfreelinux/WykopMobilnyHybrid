// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfilesState> _$profilesStateSerializer =
    new _$ProfilesStateSerializer();
Serializer<ProfileState> _$profileStateSerializer =
    new _$ProfileStateSerializer();

class _$ProfilesStateSerializer implements StructuredSerializer<ProfilesState> {
  @override
  final Iterable<Type> types = const [ProfilesState, _$ProfilesState];
  @override
  final String wireName = 'ProfilesState';

  @override
  Iterable serialize(Serializers serializers, ProfilesState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'states',
      serializers.serialize(object.states,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(ProfileState)])),
    ];

    return result;
  }

  @override
  ProfilesState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfilesStateBuilder();

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
                const FullType(ProfileState)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileStateSerializer implements StructuredSerializer<ProfileState> {
  @override
  final Iterable<Type> types = const [ProfileState, _$ProfileState];
  @override
  final String wireName = 'ProfileState';

  @override
  Iterable serialize(Serializers serializers, ProfileState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'actionsState',
      serializers.serialize(object.actionsState,
          specifiedType: const FullType(ItemListState)),
    ];

    return result;
  }

  @override
  ProfileState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'actionsState':
          result.actionsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
      }
    }

    return result.build();
  }
}

class _$ProfilesState extends ProfilesState {
  @override
  final BuiltMap<String, ProfileState> states;

  factory _$ProfilesState([void updates(ProfilesStateBuilder b)]) =>
      (new ProfilesStateBuilder()..update(updates)).build();

  _$ProfilesState._({this.states}) : super._() {
    if (states == null) {
      throw new BuiltValueNullFieldError('ProfilesState', 'states');
    }
  }

  @override
  ProfilesState rebuild(void updates(ProfilesStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfilesStateBuilder toBuilder() => new ProfilesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfilesState && states == other.states;
  }

  @override
  int get hashCode {
    return $jf($jc(0, states.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfilesState')..add('states', states))
        .toString();
  }
}

class ProfilesStateBuilder
    implements Builder<ProfilesState, ProfilesStateBuilder> {
  _$ProfilesState _$v;

  MapBuilder<String, ProfileState> _states;
  MapBuilder<String, ProfileState> get states =>
      _$this._states ??= new MapBuilder<String, ProfileState>();
  set states(MapBuilder<String, ProfileState> states) =>
      _$this._states = states;

  ProfilesStateBuilder();

  ProfilesStateBuilder get _$this {
    if (_$v != null) {
      _states = _$v.states?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfilesState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfilesState;
  }

  @override
  void update(void updates(ProfilesStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfilesState build() {
    _$ProfilesState _$result;
    try {
      _$result = _$v ?? new _$ProfilesState._(states: states.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'states';
        states.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProfilesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProfileState extends ProfileState {
  @override
  final ItemListState actionsState;

  factory _$ProfileState([void updates(ProfileStateBuilder b)]) =>
      (new ProfileStateBuilder()..update(updates)).build();

  _$ProfileState._({this.actionsState}) : super._() {
    if (actionsState == null) {
      throw new BuiltValueNullFieldError('ProfileState', 'actionsState');
    }
  }

  @override
  ProfileState rebuild(void updates(ProfileStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileStateBuilder toBuilder() => new ProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileState && actionsState == other.actionsState;
  }

  @override
  int get hashCode {
    return $jf($jc(0, actionsState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileState')
          ..add('actionsState', actionsState))
        .toString();
  }
}

class ProfileStateBuilder
    implements Builder<ProfileState, ProfileStateBuilder> {
  _$ProfileState _$v;

  ItemListStateBuilder _actionsState;
  ItemListStateBuilder get actionsState =>
      _$this._actionsState ??= new ItemListStateBuilder();
  set actionsState(ItemListStateBuilder actionsState) =>
      _$this._actionsState = actionsState;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    if (_$v != null) {
      _actionsState = _$v.actionsState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileState;
  }

  @override
  void update(void updates(ProfileStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileState build() {
    _$ProfileState _$result;
    try {
      _$result =
          _$v ?? new _$ProfileState._(actionsState: actionsState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'actionsState';
        actionsState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProfileState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
