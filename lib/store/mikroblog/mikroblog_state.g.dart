// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mikroblog_state.dart';

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

Serializer<MikroblogState> _$mikroblogStateSerializer =
    new _$MikroblogStateSerializer();

class _$MikroblogStateSerializer
    implements StructuredSerializer<MikroblogState> {
  @override
  final Iterable<Type> types = const [MikroblogState, _$MikroblogState];
  @override
  final String wireName = 'MikroblogState';

  @override
  Iterable serialize(Serializers serializers, MikroblogState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entriesState',
      serializers.serialize(object.entriesState,
          specifiedType: const FullType(EntriesState)),
      'listState',
      serializers.serialize(object.listState,
          specifiedType: const FullType(ListState)),
    ];

    return result;
  }

  @override
  MikroblogState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MikroblogStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entriesState':
          result.entriesState.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntriesState)) as EntriesState);
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

class _$MikroblogState extends MikroblogState {
  @override
  final EntriesState entriesState;
  @override
  final ListState listState;

  factory _$MikroblogState([void updates(MikroblogStateBuilder b)]) =>
      (new MikroblogStateBuilder()..update(updates)).build();

  _$MikroblogState._({this.entriesState, this.listState}) : super._() {
    if (entriesState == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'entriesState');
    }
    if (listState == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'listState');
    }
  }

  @override
  MikroblogState rebuild(void updates(MikroblogStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MikroblogStateBuilder toBuilder() =>
      new MikroblogStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MikroblogState &&
        entriesState == other.entriesState &&
        listState == other.listState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, entriesState.hashCode), listState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MikroblogState')
          ..add('entriesState', entriesState)
          ..add('listState', listState))
        .toString();
  }
}

class MikroblogStateBuilder
    implements Builder<MikroblogState, MikroblogStateBuilder> {
  _$MikroblogState _$v;

  EntriesStateBuilder _entriesState;
  EntriesStateBuilder get entriesState =>
      _$this._entriesState ??= new EntriesStateBuilder();
  set entriesState(EntriesStateBuilder entriesState) =>
      _$this._entriesState = entriesState;

  ListStateBuilder _listState;
  ListStateBuilder get listState =>
      _$this._listState ??= new ListStateBuilder();
  set listState(ListStateBuilder listState) => _$this._listState = listState;

  MikroblogStateBuilder();

  MikroblogStateBuilder get _$this {
    if (_$v != null) {
      _entriesState = _$v.entriesState?.toBuilder();
      _listState = _$v.listState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MikroblogState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MikroblogState;
  }

  @override
  void update(void updates(MikroblogStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MikroblogState build() {
    _$MikroblogState _$result;
    try {
      _$result = _$v ??
          new _$MikroblogState._(
              entriesState: entriesState.build(), listState: listState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entriesState';
        entriesState.build();
        _$failedField = 'listState';
        listState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MikroblogState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
