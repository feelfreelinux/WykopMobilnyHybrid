// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_state.dart';

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
          specifiedType: const FullType(LinksListState)),
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
              specifiedType: const FullType(LinksListState)) as LinksListState);
          break;
      }
    }

    return result.build();
  }
}

class _$LinksState extends LinksState {
  @override
  final LinksListState promotedState;

  factory _$LinksState([void updates(LinksStateBuilder b)]) =>
      (new LinksStateBuilder()..update(updates)).build();

  _$LinksState._({this.promotedState}) : super._() {
    if (promotedState == null) {
      throw new BuiltValueNullFieldError('LinksState', 'promotedState');
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
    return other is LinksState && promotedState == other.promotedState;
  }

  @override
  int get hashCode {
    return $jf($jc(0, promotedState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinksState')
          ..add('promotedState', promotedState))
        .toString();
  }
}

class LinksStateBuilder implements Builder<LinksState, LinksStateBuilder> {
  _$LinksState _$v;

  LinksListStateBuilder _promotedState;
  LinksListStateBuilder get promotedState =>
      _$this._promotedState ??= new LinksListStateBuilder();
  set promotedState(LinksListStateBuilder promotedState) =>
      _$this._promotedState = promotedState;

  LinksStateBuilder();

  LinksStateBuilder get _$this {
    if (_$v != null) {
      _promotedState = _$v.promotedState?.toBuilder();
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
      _$result =
          _$v ?? new _$LinksState._(promotedState: promotedState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'promotedState';
        promotedState.build();
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
