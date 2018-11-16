// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrylist_state.dart';

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

Serializer<EntrylistState> _$entrylistStateSerializer =
    new _$EntrylistStateSerializer();

class _$EntrylistStateSerializer
    implements StructuredSerializer<EntrylistState> {
  @override
  final Iterable<Type> types = const [EntrylistState, _$EntrylistState];
  @override
  final String wireName = 'EntrylistState';

  @override
  Iterable serialize(Serializers serializers, EntrylistState object,
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
  EntrylistState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntrylistStateBuilder();

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

class _$EntrylistState extends EntrylistState {
  @override
  final EntriesState entriesState;
  @override
  final ListState listState;

  factory _$EntrylistState([void updates(EntrylistStateBuilder b)]) =>
      (new EntrylistStateBuilder()..update(updates)).build();

  _$EntrylistState._({this.entriesState, this.listState}) : super._() {
    if (entriesState == null) {
      throw new BuiltValueNullFieldError('EntrylistState', 'entriesState');
    }
    if (listState == null) {
      throw new BuiltValueNullFieldError('EntrylistState', 'listState');
    }
  }

  @override
  EntrylistState rebuild(void updates(EntrylistStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntrylistStateBuilder toBuilder() =>
      new EntrylistStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntrylistState &&
        entriesState == other.entriesState &&
        listState == other.listState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, entriesState.hashCode), listState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntrylistState')
          ..add('entriesState', entriesState)
          ..add('listState', listState))
        .toString();
  }
}

class EntrylistStateBuilder
    implements Builder<EntrylistState, EntrylistStateBuilder> {
  _$EntrylistState _$v;

  EntriesStateBuilder _entriesState;
  EntriesStateBuilder get entriesState =>
      _$this._entriesState ??= new EntriesStateBuilder();
  set entriesState(EntriesStateBuilder entriesState) =>
      _$this._entriesState = entriesState;

  ListStateBuilder _listState;
  ListStateBuilder get listState =>
      _$this._listState ??= new ListStateBuilder();
  set listState(ListStateBuilder listState) => _$this._listState = listState;

  EntrylistStateBuilder();

  EntrylistStateBuilder get _$this {
    if (_$v != null) {
      _entriesState = _$v.entriesState?.toBuilder();
      _listState = _$v.listState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntrylistState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntrylistState;
  }

  @override
  void update(void updates(EntrylistStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntrylistState build() {
    _$EntrylistState _$result;
    try {
      _$result = _$v ??
          new _$EntrylistState._(
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
            'EntrylistState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
