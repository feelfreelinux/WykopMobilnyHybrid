// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchState> _$searchStateSerializer = new _$SearchStateSerializer();

class _$SearchStateSerializer implements StructuredSerializer<SearchState> {
  @override
  final Iterable<Type> types = const [SearchState, _$SearchState];
  @override
  final String wireName = 'SearchState';

  @override
  Iterable serialize(Serializers serializers, SearchState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entriesSearchState',
      serializers.serialize(object.entriesSearchState,
          specifiedType: const FullType(ItemListState)),
      'linksSearchState',
      serializers.serialize(object.linksSearchState,
          specifiedType: const FullType(ItemListState)),
    ];

    return result;
  }

  @override
  SearchState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entriesSearchState':
          result.entriesSearchState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'linksSearchState':
          result.linksSearchState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
      }
    }

    return result.build();
  }
}

class _$SearchState extends SearchState {
  @override
  final ItemListState entriesSearchState;
  @override
  final ItemListState linksSearchState;

  factory _$SearchState([void updates(SearchStateBuilder b)]) =>
      (new SearchStateBuilder()..update(updates)).build();

  _$SearchState._({this.entriesSearchState, this.linksSearchState})
      : super._() {
    if (entriesSearchState == null) {
      throw new BuiltValueNullFieldError('SearchState', 'entriesSearchState');
    }
    if (linksSearchState == null) {
      throw new BuiltValueNullFieldError('SearchState', 'linksSearchState');
    }
  }

  @override
  SearchState rebuild(void updates(SearchStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchStateBuilder toBuilder() => new SearchStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchState &&
        entriesSearchState == other.entriesSearchState &&
        linksSearchState == other.linksSearchState;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, entriesSearchState.hashCode), linksSearchState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchState')
          ..add('entriesSearchState', entriesSearchState)
          ..add('linksSearchState', linksSearchState))
        .toString();
  }
}

class SearchStateBuilder implements Builder<SearchState, SearchStateBuilder> {
  _$SearchState _$v;

  ItemListStateBuilder _entriesSearchState;
  ItemListStateBuilder get entriesSearchState =>
      _$this._entriesSearchState ??= new ItemListStateBuilder();
  set entriesSearchState(ItemListStateBuilder entriesSearchState) =>
      _$this._entriesSearchState = entriesSearchState;

  ItemListStateBuilder _linksSearchState;
  ItemListStateBuilder get linksSearchState =>
      _$this._linksSearchState ??= new ItemListStateBuilder();
  set linksSearchState(ItemListStateBuilder linksSearchState) =>
      _$this._linksSearchState = linksSearchState;

  SearchStateBuilder();

  SearchStateBuilder get _$this {
    if (_$v != null) {
      _entriesSearchState = _$v.entriesSearchState?.toBuilder();
      _linksSearchState = _$v.linksSearchState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchState;
  }

  @override
  void update(void updates(SearchStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchState build() {
    _$SearchState _$result;
    try {
      _$result = _$v ??
          new _$SearchState._(
              entriesSearchState: entriesSearchState.build(),
              linksSearchState: linksSearchState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entriesSearchState';
        entriesSearchState.build();
        _$failedField = 'linksSearchState';
        linksSearchState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
