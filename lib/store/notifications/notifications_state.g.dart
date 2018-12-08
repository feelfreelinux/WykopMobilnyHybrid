// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_state.dart';

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

Serializer<NotificationsState> _$notificationsStateSerializer =
    new _$NotificationsStateSerializer();

class _$NotificationsStateSerializer
    implements StructuredSerializer<NotificationsState> {
  @override
  final Iterable<Type> types = const [NotificationsState, _$NotificationsState];
  @override
  final String wireName = 'NotificationsState';

  @override
  Iterable serialize(Serializers serializers, NotificationsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hashTagsState',
      serializers.serialize(object.hashTagsState,
          specifiedType: const FullType(ItemListState)),
      'notificationsState',
      serializers.serialize(object.notificationsState,
          specifiedType: const FullType(ItemListState)),
    ];

    return result;
  }

  @override
  NotificationsState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hashTagsState':
          result.hashTagsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
        case 'notificationsState':
          result.notificationsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ItemListState)) as ItemListState);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsState extends NotificationsState {
  @override
  final ItemListState hashTagsState;
  @override
  final ItemListState notificationsState;

  factory _$NotificationsState([void updates(NotificationsStateBuilder b)]) =>
      (new NotificationsStateBuilder()..update(updates)).build();

  _$NotificationsState._({this.hashTagsState, this.notificationsState})
      : super._() {
    if (hashTagsState == null) {
      throw new BuiltValueNullFieldError('NotificationsState', 'hashTagsState');
    }
    if (notificationsState == null) {
      throw new BuiltValueNullFieldError(
          'NotificationsState', 'notificationsState');
    }
  }

  @override
  NotificationsState rebuild(void updates(NotificationsStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsStateBuilder toBuilder() =>
      new NotificationsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsState &&
        hashTagsState == other.hashTagsState &&
        notificationsState == other.notificationsState;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, hashTagsState.hashCode), notificationsState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotificationsState')
          ..add('hashTagsState', hashTagsState)
          ..add('notificationsState', notificationsState))
        .toString();
  }
}

class NotificationsStateBuilder
    implements Builder<NotificationsState, NotificationsStateBuilder> {
  _$NotificationsState _$v;

  ItemListStateBuilder _hashTagsState;
  ItemListStateBuilder get hashTagsState =>
      _$this._hashTagsState ??= new ItemListStateBuilder();
  set hashTagsState(ItemListStateBuilder hashTagsState) =>
      _$this._hashTagsState = hashTagsState;

  ItemListStateBuilder _notificationsState;
  ItemListStateBuilder get notificationsState =>
      _$this._notificationsState ??= new ItemListStateBuilder();
  set notificationsState(ItemListStateBuilder notificationsState) =>
      _$this._notificationsState = notificationsState;

  NotificationsStateBuilder();

  NotificationsStateBuilder get _$this {
    if (_$v != null) {
      _hashTagsState = _$v.hashTagsState?.toBuilder();
      _notificationsState = _$v.notificationsState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NotificationsState;
  }

  @override
  void update(void updates(NotificationsStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NotificationsState build() {
    _$NotificationsState _$result;
    try {
      _$result = _$v ??
          new _$NotificationsState._(
              hashTagsState: hashTagsState.build(),
              notificationsState: notificationsState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hashTagsState';
        hashTagsState.build();
        _$failedField = 'notificationsState';
        notificationsState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NotificationsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
