// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ItemListState> _$itemListStateSerializer =
    new _$ItemListStateSerializer();

class _$ItemListStateSerializer implements StructuredSerializer<ItemListState> {
  @override
  final Iterable<Type> types = const [ItemListState, _$ItemListState];
  @override
  final String wireName = 'ItemListState';

  @override
  Iterable serialize(Serializers serializers, ItemListState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'paginationState',
      serializers.serialize(object.paginationState,
          specifiedType: const FullType(PaginationState)),
      'listState',
      serializers.serialize(object.listState,
          specifiedType: const FullType(ListState)),
      'errorState',
      serializers.serialize(object.errorState,
          specifiedType: const FullType(ErrorState)),
    ];

    return result;
  }

  @override
  ItemListState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemListStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'paginationState':
          result.paginationState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PaginationState))
              as PaginationState);
          break;
        case 'listState':
          result.listState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ListState)) as ListState);
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

class _$ItemListState extends ItemListState {
  @override
  final PaginationState paginationState;
  @override
  final ListState listState;
  @override
  final ErrorState errorState;

  factory _$ItemListState([void updates(ItemListStateBuilder b)]) =>
      (new ItemListStateBuilder()..update(updates)).build();

  _$ItemListState._({this.paginationState, this.listState, this.errorState})
      : super._() {
    if (paginationState == null) {
      throw new BuiltValueNullFieldError('ItemListState', 'paginationState');
    }
    if (listState == null) {
      throw new BuiltValueNullFieldError('ItemListState', 'listState');
    }
    if (errorState == null) {
      throw new BuiltValueNullFieldError('ItemListState', 'errorState');
    }
  }

  @override
  ItemListState rebuild(void updates(ItemListStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemListStateBuilder toBuilder() => new ItemListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemListState &&
        paginationState == other.paginationState &&
        listState == other.listState &&
        errorState == other.errorState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, paginationState.hashCode), listState.hashCode),
        errorState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ItemListState')
          ..add('paginationState', paginationState)
          ..add('listState', listState)
          ..add('errorState', errorState))
        .toString();
  }
}

class ItemListStateBuilder
    implements Builder<ItemListState, ItemListStateBuilder> {
  _$ItemListState _$v;

  PaginationStateBuilder _paginationState;
  PaginationStateBuilder get paginationState =>
      _$this._paginationState ??= new PaginationStateBuilder();
  set paginationState(PaginationStateBuilder paginationState) =>
      _$this._paginationState = paginationState;

  ListStateBuilder _listState;
  ListStateBuilder get listState =>
      _$this._listState ??= new ListStateBuilder();
  set listState(ListStateBuilder listState) => _$this._listState = listState;

  ErrorStateBuilder _errorState;
  ErrorStateBuilder get errorState =>
      _$this._errorState ??= new ErrorStateBuilder();
  set errorState(ErrorStateBuilder errorState) =>
      _$this._errorState = errorState;

  ItemListStateBuilder();

  ItemListStateBuilder get _$this {
    if (_$v != null) {
      _paginationState = _$v.paginationState?.toBuilder();
      _listState = _$v.listState?.toBuilder();
      _errorState = _$v.errorState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemListState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ItemListState;
  }

  @override
  void update(void updates(ItemListStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ItemListState build() {
    _$ItemListState _$result;
    try {
      _$result = _$v ??
          new _$ItemListState._(
              paginationState: paginationState.build(),
              listState: listState.build(),
              errorState: errorState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'paginationState';
        paginationState.build();
        _$failedField = 'listState';
        listState.build();
        _$failedField = 'errorState';
        errorState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ItemListState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
