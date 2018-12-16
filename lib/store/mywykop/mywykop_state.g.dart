// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mywykop_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyWykopState> _$myWykopStateSerializer =
    new _$MyWykopStateSerializer();

class _$MyWykopStateSerializer implements StructuredSerializer<MyWykopState> {
  @override
  final Iterable<Type> types = const [MyWykopState, _$MyWykopState];
  @override
  final String wireName = 'MyWykopState';

  @override
  Iterable serialize(Serializers serializers, MyWykopState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'indexState',
      serializers.serialize(object.indexState,
          specifiedType: const FullType(ItemListState)),
    ];

    return result;
  }

  @override
  MyWykopState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyWykopStateBuilder();

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
      }
    }

    return result.build();
  }
}

class _$MyWykopState extends MyWykopState {
  @override
  final ItemListState indexState;

  factory _$MyWykopState([void updates(MyWykopStateBuilder b)]) =>
      (new MyWykopStateBuilder()..update(updates)).build();

  _$MyWykopState._({this.indexState}) : super._() {
    if (indexState == null) {
      throw new BuiltValueNullFieldError('MyWykopState', 'indexState');
    }
  }

  @override
  MyWykopState rebuild(void updates(MyWykopStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MyWykopStateBuilder toBuilder() => new MyWykopStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyWykopState && indexState == other.indexState;
  }

  @override
  int get hashCode {
    return $jf($jc(0, indexState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MyWykopState')
          ..add('indexState', indexState))
        .toString();
  }
}

class MyWykopStateBuilder
    implements Builder<MyWykopState, MyWykopStateBuilder> {
  _$MyWykopState _$v;

  ItemListStateBuilder _indexState;
  ItemListStateBuilder get indexState =>
      _$this._indexState ??= new ItemListStateBuilder();
  set indexState(ItemListStateBuilder indexState) =>
      _$this._indexState = indexState;

  MyWykopStateBuilder();

  MyWykopStateBuilder get _$this {
    if (_$v != null) {
      _indexState = _$v.indexState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyWykopState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MyWykopState;
  }

  @override
  void update(void updates(MyWykopStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MyWykopState build() {
    _$MyWykopState _$result;
    try {
      _$result = _$v ?? new _$MyWykopState._(indexState: indexState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'indexState';
        indexState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MyWykopState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
