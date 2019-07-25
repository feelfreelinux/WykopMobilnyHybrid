// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_list_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GlobalListState> _$globalListStateSerializer =
    new _$GlobalListStateSerializer();

class _$GlobalListStateSerializer
    implements StructuredSerializer<GlobalListState> {
  @override
  final Iterable<Type> types = const [GlobalListState, _$GlobalListState];
  @override
  final String wireName = 'GlobalListState';

  @override
  Iterable<Object> serialize(Serializers serializers, GlobalListState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'showListShadow',
      serializers.serialize(object.showListShadow,
          specifiedType: const FullType(bool)),
      'showInputShadow',
      serializers.serialize(object.showInputShadow,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GlobalListState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GlobalListStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'showListShadow':
          result.showListShadow = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'showInputShadow':
          result.showInputShadow = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GlobalListState extends GlobalListState {
  @override
  final bool showListShadow;
  @override
  final bool showInputShadow;

  factory _$GlobalListState([void Function(GlobalListStateBuilder) updates]) =>
      (new GlobalListStateBuilder()..update(updates)).build();

  _$GlobalListState._({this.showListShadow, this.showInputShadow}) : super._() {
    if (showListShadow == null) {
      throw new BuiltValueNullFieldError('GlobalListState', 'showListShadow');
    }
    if (showInputShadow == null) {
      throw new BuiltValueNullFieldError('GlobalListState', 'showInputShadow');
    }
  }

  @override
  GlobalListState rebuild(void Function(GlobalListStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalListStateBuilder toBuilder() =>
      new GlobalListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalListState &&
        showListShadow == other.showListShadow &&
        showInputShadow == other.showInputShadow;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, showListShadow.hashCode), showInputShadow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GlobalListState')
          ..add('showListShadow', showListShadow)
          ..add('showInputShadow', showInputShadow))
        .toString();
  }
}

class GlobalListStateBuilder
    implements Builder<GlobalListState, GlobalListStateBuilder> {
  _$GlobalListState _$v;

  bool _showListShadow;
  bool get showListShadow => _$this._showListShadow;
  set showListShadow(bool showListShadow) =>
      _$this._showListShadow = showListShadow;

  bool _showInputShadow;
  bool get showInputShadow => _$this._showInputShadow;
  set showInputShadow(bool showInputShadow) =>
      _$this._showInputShadow = showInputShadow;

  GlobalListStateBuilder();

  GlobalListStateBuilder get _$this {
    if (_$v != null) {
      _showListShadow = _$v.showListShadow;
      _showInputShadow = _$v.showInputShadow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GlobalListState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GlobalListState;
  }

  @override
  void update(void Function(GlobalListStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GlobalListState build() {
    final _$result = _$v ??
        new _$GlobalListState._(
            showListShadow: showListShadow, showInputShadow: showInputShadow);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
