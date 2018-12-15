// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mikroblog_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MikroblogState> _$mikroblogStateSerializer =
    new _$MikroblogStateSerializer();

class _$MikroblogStateSerializer
    implements StructuredSerializer<MikroblogState> {
  @override
  final Iterable<Type> types = const [MikroblogState, _$MikroblogState];
  @override
  final String wireName = 'MikroblogState';

  @override
  Iterable serialize(Serializers serializers, MikroblogState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hot12State',
      serializers.serialize(object.hot12State,
          specifiedType: const FullType(ItemListState)),
      'hot24State',
      serializers.serialize(object.hot24State,
          specifiedType: const FullType(ItemListState)),
      'hot6State',
      serializers.serialize(object.hot6State,
          specifiedType: const FullType(ItemListState)),
      'activeState',
      serializers.serialize(object.activeState,
          specifiedType: const FullType(ItemListState)),
      'newestState',
      serializers.serialize(object.newestState,
          specifiedType: const FullType(ItemListState)),
    ];

    return result;
  }

  @override
  MikroblogState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MikroblogStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hot12State':
          result.hot12State.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'hot24State':
          result.hot24State.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'hot6State':
          result.hot6State.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'activeState':
          result.activeState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'newestState':
          result.newestState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
      }
    }

    return result.build();
  }
}

class _$MikroblogState extends MikroblogState {
  @override
  final ItemListState hot12State;
  @override
  final ItemListState hot24State;
  @override
  final ItemListState hot6State;
  @override
  final ItemListState activeState;
  @override
  final ItemListState newestState;

  factory _$MikroblogState([void updates(MikroblogStateBuilder b)]) =>
      (new MikroblogStateBuilder()..update(updates)).build();

  _$MikroblogState._(
      {this.hot12State,
      this.hot24State,
      this.hot6State,
      this.activeState,
      this.newestState})
      : super._() {
    if (hot12State == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'hot12State');
    }
    if (hot24State == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'hot24State');
    }
    if (hot6State == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'hot6State');
    }
    if (activeState == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'activeState');
    }
    if (newestState == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'newestState');
    }
  }

  @override
  MikroblogState rebuild(void updates(MikroblogStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MikroblogStateBuilder toBuilder() =>
      new MikroblogStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MikroblogState &&
        hot12State == other.hot12State &&
        hot24State == other.hot24State &&
        hot6State == other.hot6State &&
        activeState == other.activeState &&
        newestState == other.newestState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, hot12State.hashCode), hot24State.hashCode),
                hot6State.hashCode),
            activeState.hashCode),
        newestState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MikroblogState')
          ..add('hot12State', hot12State)
          ..add('hot24State', hot24State)
          ..add('hot6State', hot6State)
          ..add('activeState', activeState)
          ..add('newestState', newestState))
        .toString();
  }
}

class MikroblogStateBuilder
    implements Builder<MikroblogState, MikroblogStateBuilder> {
  _$MikroblogState _$v;

  ItemListStateBuilder _hot12State;
  ItemListStateBuilder get hot12State =>
      _$this._hot12State ??= new ItemListStateBuilder();
  set hot12State(ItemListStateBuilder hot12State) =>
      _$this._hot12State = hot12State;

  ItemListStateBuilder _hot24State;
  ItemListStateBuilder get hot24State =>
      _$this._hot24State ??= new ItemListStateBuilder();
  set hot24State(ItemListStateBuilder hot24State) =>
      _$this._hot24State = hot24State;

  ItemListStateBuilder _hot6State;
  ItemListStateBuilder get hot6State =>
      _$this._hot6State ??= new ItemListStateBuilder();
  set hot6State(ItemListStateBuilder hot6State) =>
      _$this._hot6State = hot6State;

  ItemListStateBuilder _activeState;
  ItemListStateBuilder get activeState =>
      _$this._activeState ??= new ItemListStateBuilder();
  set activeState(ItemListStateBuilder activeState) =>
      _$this._activeState = activeState;

  ItemListStateBuilder _newestState;
  ItemListStateBuilder get newestState =>
      _$this._newestState ??= new ItemListStateBuilder();
  set newestState(ItemListStateBuilder newestState) =>
      _$this._newestState = newestState;

  MikroblogStateBuilder();

  MikroblogStateBuilder get _$this {
    if (_$v != null) {
      _hot12State = _$v.hot12State?.toBuilder();
      _hot24State = _$v.hot24State?.toBuilder();
      _hot6State = _$v.hot6State?.toBuilder();
      _activeState = _$v.activeState?.toBuilder();
      _newestState = _$v.newestState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MikroblogState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MikroblogState;
  }

  @override
  void update(void updates(MikroblogStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MikroblogState build() {
    _$MikroblogState _$result;
    try {
      _$result = _$v ??
          new _$MikroblogState._(
              hot12State: hot12State.build(),
              hot24State: hot24State.build(),
              hot6State: hot6State.build(),
              activeState: activeState.build(),
              newestState: newestState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hot12State';
        hot12State.build();
        _$failedField = 'hot24State';
        hot24State.build();
        _$failedField = 'hot6State';
        hot6State.build();
        _$failedField = 'activeState';
        activeState.build();
        _$failedField = 'newestState';
        newestState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MikroblogState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
