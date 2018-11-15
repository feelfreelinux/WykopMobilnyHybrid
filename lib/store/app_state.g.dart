// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

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

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entitiesState',
      serializers.serialize(object.entitiesState,
          specifiedType: const FullType(EntitiesState)),
      'hot12State',
      serializers.serialize(object.hot12State,
          specifiedType: const FullType(MikroblogState)),
      'hot24State',
      serializers.serialize(object.hot24State,
          specifiedType: const FullType(MikroblogState)),
      'hot6State',
      serializers.serialize(object.hot6State,
          specifiedType: const FullType(MikroblogState)),
      'activeState',
      serializers.serialize(object.activeState,
          specifiedType: const FullType(MikroblogState)),
      'newest',
      serializers.serialize(object.newest,
          specifiedType: const FullType(MikroblogState)),
      'entryScreensState',
      serializers.serialize(object.entryScreensState,
          specifiedType: const FullType(EntryScreensState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entitiesState':
          result.entitiesState.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntitiesState)) as EntitiesState);
          break;
        case 'hot12State':
          result.hot12State.replace(serializers.deserialize(value,
              specifiedType: const FullType(MikroblogState)) as MikroblogState);
          break;
        case 'hot24State':
          result.hot24State.replace(serializers.deserialize(value,
              specifiedType: const FullType(MikroblogState)) as MikroblogState);
          break;
        case 'hot6State':
          result.hot6State.replace(serializers.deserialize(value,
              specifiedType: const FullType(MikroblogState)) as MikroblogState);
          break;
        case 'activeState':
          result.activeState.replace(serializers.deserialize(value,
              specifiedType: const FullType(MikroblogState)) as MikroblogState);
          break;
        case 'newest':
          result.newest.replace(serializers.deserialize(value,
              specifiedType: const FullType(MikroblogState)) as MikroblogState);
          break;
        case 'entryScreensState':
          result.entryScreensState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(EntryScreensState))
              as EntryScreensState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final EntitiesState entitiesState;
  @override
  final MikroblogState hot12State;
  @override
  final MikroblogState hot24State;
  @override
  final MikroblogState hot6State;
  @override
  final MikroblogState activeState;
  @override
  final MikroblogState newest;
  @override
  final EntryScreensState entryScreensState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.entitiesState,
      this.hot12State,
      this.hot24State,
      this.hot6State,
      this.activeState,
      this.newest,
      this.entryScreensState})
      : super._() {
    if (entitiesState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entitiesState');
    }
    if (hot12State == null) {
      throw new BuiltValueNullFieldError('AppState', 'hot12State');
    }
    if (hot24State == null) {
      throw new BuiltValueNullFieldError('AppState', 'hot24State');
    }
    if (hot6State == null) {
      throw new BuiltValueNullFieldError('AppState', 'hot6State');
    }
    if (activeState == null) {
      throw new BuiltValueNullFieldError('AppState', 'activeState');
    }
    if (newest == null) {
      throw new BuiltValueNullFieldError('AppState', 'newest');
    }
    if (entryScreensState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entryScreensState');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        entitiesState == other.entitiesState &&
        hot12State == other.hot12State &&
        hot24State == other.hot24State &&
        hot6State == other.hot6State &&
        activeState == other.activeState &&
        newest == other.newest &&
        entryScreensState == other.entryScreensState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, entitiesState.hashCode),
                            hot12State.hashCode),
                        hot24State.hashCode),
                    hot6State.hashCode),
                activeState.hashCode),
            newest.hashCode),
        entryScreensState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('entitiesState', entitiesState)
          ..add('hot12State', hot12State)
          ..add('hot24State', hot24State)
          ..add('hot6State', hot6State)
          ..add('activeState', activeState)
          ..add('newest', newest)
          ..add('entryScreensState', entryScreensState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  EntitiesStateBuilder _entitiesState;
  EntitiesStateBuilder get entitiesState =>
      _$this._entitiesState ??= new EntitiesStateBuilder();
  set entitiesState(EntitiesStateBuilder entitiesState) =>
      _$this._entitiesState = entitiesState;

  MikroblogStateBuilder _hot12State;
  MikroblogStateBuilder get hot12State =>
      _$this._hot12State ??= new MikroblogStateBuilder();
  set hot12State(MikroblogStateBuilder hot12State) =>
      _$this._hot12State = hot12State;

  MikroblogStateBuilder _hot24State;
  MikroblogStateBuilder get hot24State =>
      _$this._hot24State ??= new MikroblogStateBuilder();
  set hot24State(MikroblogStateBuilder hot24State) =>
      _$this._hot24State = hot24State;

  MikroblogStateBuilder _hot6State;
  MikroblogStateBuilder get hot6State =>
      _$this._hot6State ??= new MikroblogStateBuilder();
  set hot6State(MikroblogStateBuilder hot6State) =>
      _$this._hot6State = hot6State;

  MikroblogStateBuilder _activeState;
  MikroblogStateBuilder get activeState =>
      _$this._activeState ??= new MikroblogStateBuilder();
  set activeState(MikroblogStateBuilder activeState) =>
      _$this._activeState = activeState;

  MikroblogStateBuilder _newest;
  MikroblogStateBuilder get newest =>
      _$this._newest ??= new MikroblogStateBuilder();
  set newest(MikroblogStateBuilder newest) => _$this._newest = newest;

  EntryScreensStateBuilder _entryScreensState;
  EntryScreensStateBuilder get entryScreensState =>
      _$this._entryScreensState ??= new EntryScreensStateBuilder();
  set entryScreensState(EntryScreensStateBuilder entryScreensState) =>
      _$this._entryScreensState = entryScreensState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _entitiesState = _$v.entitiesState?.toBuilder();
      _hot12State = _$v.hot12State?.toBuilder();
      _hot24State = _$v.hot24State?.toBuilder();
      _hot6State = _$v.hot6State?.toBuilder();
      _activeState = _$v.activeState?.toBuilder();
      _newest = _$v.newest?.toBuilder();
      _entryScreensState = _$v.entryScreensState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              entitiesState: entitiesState.build(),
              hot12State: hot12State.build(),
              hot24State: hot24State.build(),
              hot6State: hot6State.build(),
              activeState: activeState.build(),
              newest: newest.build(),
              entryScreensState: entryScreensState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entitiesState';
        entitiesState.build();
        _$failedField = 'hot12State';
        hot12State.build();
        _$failedField = 'hot24State';
        hot24State.build();
        _$failedField = 'hot6State';
        hot6State.build();
        _$failedField = 'activeState';
        activeState.build();
        _$failedField = 'newest';
        newest.build();
        _$failedField = 'entryScreensState';
        entryScreensState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
