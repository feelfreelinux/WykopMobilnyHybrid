// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListState> _$listStateSerializer = new _$ListStateSerializer();

class _$ListStateSerializer implements StructuredSerializer<ListState> {
  @override
  final Iterable<Type> types = const [ListState, _$ListState];
  @override
  final String wireName = 'ListState';

  @override
  Iterable serialize(Serializers serializers, ListState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'haveReachedEnd',
      serializers.serialize(object.haveReachedEnd,
          specifiedType: const FullType(bool)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(num)),
    ];

    return result;
  }

  @override
  ListState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'haveReachedEnd':
          result.haveReachedEnd = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
      }
    }

    return result.build();
  }
}

class _$ListState extends ListState {
  @override
  final bool isLoading;
  @override
  final bool haveReachedEnd;
  @override
  final num page;

  factory _$ListState([void updates(ListStateBuilder b)]) =>
      (new ListStateBuilder()..update(updates)).build();

  _$ListState._({this.isLoading, this.haveReachedEnd, this.page}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('ListState', 'isLoading');
    }
    if (haveReachedEnd == null) {
      throw new BuiltValueNullFieldError('ListState', 'haveReachedEnd');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('ListState', 'page');
    }
  }

  @override
  ListState rebuild(void updates(ListStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ListStateBuilder toBuilder() => new ListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListState &&
        isLoading == other.isLoading &&
        haveReachedEnd == other.haveReachedEnd &&
        page == other.page;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isLoading.hashCode), haveReachedEnd.hashCode),
        page.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ListState')
          ..add('isLoading', isLoading)
          ..add('haveReachedEnd', haveReachedEnd)
          ..add('page', page))
        .toString();
  }
}

class ListStateBuilder implements Builder<ListState, ListStateBuilder> {
  _$ListState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _haveReachedEnd;
  bool get haveReachedEnd => _$this._haveReachedEnd;
  set haveReachedEnd(bool haveReachedEnd) =>
      _$this._haveReachedEnd = haveReachedEnd;

  num _page;
  num get page => _$this._page;
  set page(num page) => _$this._page = page;

  ListStateBuilder();

  ListStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _haveReachedEnd = _$v.haveReachedEnd;
      _page = _$v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ListState;
  }

  @override
  void update(void updates(ListStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ListState build() {
    final _$result = _$v ??
        new _$ListState._(
            isLoading: isLoading, haveReachedEnd: haveReachedEnd, page: page);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
