// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_list_state.dart';

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

Serializer<LinksListState> _$linksListStateSerializer =
    new _$LinksListStateSerializer();

class _$LinksListStateSerializer
    implements StructuredSerializer<LinksListState> {
  @override
  final Iterable<Type> types = const [LinksListState, _$LinksListState];
  @override
  final String wireName = 'LinksListState';

  @override
  Iterable serialize(Serializers serializers, LinksListState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'itemsState',
      serializers.serialize(object.itemsState,
          specifiedType: const FullType(PaginationState)),
      'listState',
      serializers.serialize(object.listState,
          specifiedType: const FullType(ListState)),
    ];

    return result;
  }

  @override
  LinksListState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinksListStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'itemsState':
          result.itemsState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PaginationState))
              as PaginationState);
          break;
        case 'listState':
          result.listState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ListState)) as ListState);
          break;
      }
    }

    return result.build();
  }
}

class _$LinksListState extends LinksListState {
  @override
  final PaginationState itemsState;
  @override
  final ListState listState;

  factory _$LinksListState([void updates(LinksListStateBuilder b)]) =>
      (new LinksListStateBuilder()..update(updates)).build();

  _$LinksListState._({this.itemsState, this.listState}) : super._() {
    if (itemsState == null) {
      throw new BuiltValueNullFieldError('LinksListState', 'itemsState');
    }
    if (listState == null) {
      throw new BuiltValueNullFieldError('LinksListState', 'listState');
    }
  }

  @override
  LinksListState rebuild(void updates(LinksListStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LinksListStateBuilder toBuilder() =>
      new LinksListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinksListState &&
        itemsState == other.itemsState &&
        listState == other.listState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, itemsState.hashCode), listState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinksListState')
          ..add('itemsState', itemsState)
          ..add('listState', listState))
        .toString();
  }
}

class LinksListStateBuilder
    implements Builder<LinksListState, LinksListStateBuilder> {
  _$LinksListState _$v;

  PaginationStateBuilder _itemsState;
  PaginationStateBuilder get itemsState =>
      _$this._itemsState ??= new PaginationStateBuilder();
  set itemsState(PaginationStateBuilder itemsState) =>
      _$this._itemsState = itemsState;

  ListStateBuilder _listState;
  ListStateBuilder get listState =>
      _$this._listState ??= new ListStateBuilder();
  set listState(ListStateBuilder listState) => _$this._listState = listState;

  LinksListStateBuilder();

  LinksListStateBuilder get _$this {
    if (_$v != null) {
      _itemsState = _$v.itemsState?.toBuilder();
      _listState = _$v.listState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinksListState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinksListState;
  }

  @override
  void update(void updates(LinksListStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LinksListState build() {
    _$LinksListState _$result;
    try {
      _$result = _$v ??
          new _$LinksListState._(
              itemsState: itemsState.build(), listState: listState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'itemsState';
        itemsState.build();
        _$failedField = 'listState';
        listState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinksListState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
