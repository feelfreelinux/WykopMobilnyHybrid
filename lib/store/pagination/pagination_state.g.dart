// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaginationState> _$paginationStateSerializer =
    new _$PaginationStateSerializer();

class _$PaginationStateSerializer
    implements StructuredSerializer<PaginationState> {
  @override
  final Iterable<Type> types = const [PaginationState, _$PaginationState];
  @override
  final String wireName = 'PaginationState';

  @override
  Iterable<Object> serialize(Serializers serializers, PaginationState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'itemIds',
      serializers.serialize(object.itemIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  PaginationState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaginationStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'itemIds':
          result.itemIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$PaginationState extends PaginationState {
  @override
  final BuiltList<int> itemIds;

  factory _$PaginationState([void Function(PaginationStateBuilder) updates]) =>
      (new PaginationStateBuilder()..update(updates)).build();

  _$PaginationState._({this.itemIds}) : super._() {
    if (itemIds == null) {
      throw new BuiltValueNullFieldError('PaginationState', 'itemIds');
    }
  }

  @override
  PaginationState rebuild(void Function(PaginationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationStateBuilder toBuilder() =>
      new PaginationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationState && itemIds == other.itemIds;
  }

  @override
  int get hashCode {
    return $jf($jc(0, itemIds.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaginationState')
          ..add('itemIds', itemIds))
        .toString();
  }
}

class PaginationStateBuilder
    implements Builder<PaginationState, PaginationStateBuilder> {
  _$PaginationState _$v;

  ListBuilder<int> _itemIds;
  ListBuilder<int> get itemIds => _$this._itemIds ??= new ListBuilder<int>();
  set itemIds(ListBuilder<int> itemIds) => _$this._itemIds = itemIds;

  PaginationStateBuilder();

  PaginationStateBuilder get _$this {
    if (_$v != null) {
      _itemIds = _$v.itemIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PaginationState;
  }

  @override
  void update(void Function(PaginationStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaginationState build() {
    _$PaginationState _$result;
    try {
      _$result = _$v ?? new _$PaginationState._(itemIds: itemIds.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'itemIds';
        itemIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PaginationState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
