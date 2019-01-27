// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinksState> _$linksStateSerializer = new _$LinksStateSerializer();

class _$LinksStateSerializer implements StructuredSerializer<LinksState> {
  @override
  final Iterable<Type> types = const [LinksState, _$LinksState];
  @override
  final String wireName = 'LinksState';

  @override
  Iterable serialize(Serializers serializers, LinksState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'promotedState',
      serializers.serialize(object.promotedState,
          specifiedType: const FullType(ItemListState)),
      'favoriteState',
      serializers.serialize(object.favoriteState,
          specifiedType: const FullType(ItemListState)),
    ];

    return result;
  }

  @override
  LinksState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinksStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'promotedState':
          result.promotedState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'favoriteState':
          result.favoriteState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
      }
    }

    return result.build();
  }
}

class _$LinksState extends LinksState {
  @override
  final ItemListState promotedState;
  @override
  final ItemListState favoriteState;

  factory _$LinksState([void updates(LinksStateBuilder b)]) =>
      (new LinksStateBuilder()..update(updates)).build();

  _$LinksState._({this.promotedState, this.favoriteState}) : super._() {
    if (promotedState == null) {
      throw new BuiltValueNullFieldError('LinksState', 'promotedState');
    }
    if (favoriteState == null) {
      throw new BuiltValueNullFieldError('LinksState', 'favoriteState');
    }
  }

  @override
  LinksState rebuild(void updates(LinksStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LinksStateBuilder toBuilder() => new LinksStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinksState &&
        promotedState == other.promotedState &&
        favoriteState == other.favoriteState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, promotedState.hashCode), favoriteState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinksState')
          ..add('promotedState', promotedState)
          ..add('favoriteState', favoriteState))
        .toString();
  }
}

class LinksStateBuilder implements Builder<LinksState, LinksStateBuilder> {
  _$LinksState _$v;

  ItemListStateBuilder _promotedState;
  ItemListStateBuilder get promotedState =>
      _$this._promotedState ??= new ItemListStateBuilder();
  set promotedState(ItemListStateBuilder promotedState) =>
      _$this._promotedState = promotedState;

  ItemListStateBuilder _favoriteState;
  ItemListStateBuilder get favoriteState =>
      _$this._favoriteState ??= new ItemListStateBuilder();
  set favoriteState(ItemListStateBuilder favoriteState) =>
      _$this._favoriteState = favoriteState;

  LinksStateBuilder();

  LinksStateBuilder get _$this {
    if (_$v != null) {
      _promotedState = _$v.promotedState?.toBuilder();
      _favoriteState = _$v.favoriteState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinksState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinksState;
  }

  @override
  void update(void updates(LinksStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LinksState build() {
    _$LinksState _$result;
    try {
      _$result = _$v ??
          new _$LinksState._(
              promotedState: promotedState.build(),
              favoriteState: favoriteState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'promotedState';
        promotedState.build();
        _$failedField = 'favoriteState';
        favoriteState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinksState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
