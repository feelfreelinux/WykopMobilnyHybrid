// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries_state.dart';

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

Serializer<EntriesState> _$entriesStateSerializer =
    new _$EntriesStateSerializer();

class _$EntriesStateSerializer implements StructuredSerializer<EntriesState> {
  @override
  final Iterable<Type> types = const [EntriesState, _$EntriesState];
  @override
  final String wireName = 'EntriesState';

  @override
  Iterable serialize(Serializers serializers, EntriesState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entryIds',
      serializers.serialize(object.entryIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];

    return result;
  }

  @override
  EntriesState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntriesStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entryIds':
          result.entryIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$EntriesState extends EntriesState {
  @override
  final BuiltList<int> entryIds;

  factory _$EntriesState([void updates(EntriesStateBuilder b)]) =>
      (new EntriesStateBuilder()..update(updates)).build();

  _$EntriesState._({this.entryIds}) : super._() {
    if (entryIds == null) {
      throw new BuiltValueNullFieldError('EntriesState', 'entryIds');
    }
  }

  @override
  EntriesState rebuild(void updates(EntriesStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntriesStateBuilder toBuilder() => new EntriesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntriesState && entryIds == other.entryIds;
  }

  @override
  int get hashCode {
    return $jf($jc(0, entryIds.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntriesState')
          ..add('entryIds', entryIds))
        .toString();
  }
}

class EntriesStateBuilder
    implements Builder<EntriesState, EntriesStateBuilder> {
  _$EntriesState _$v;

  ListBuilder<int> _entryIds;
  ListBuilder<int> get entryIds => _$this._entryIds ??= new ListBuilder<int>();
  set entryIds(ListBuilder<int> entryIds) => _$this._entryIds = entryIds;

  EntriesStateBuilder();

  EntriesStateBuilder get _$this {
    if (_$v != null) {
      _entryIds = _$v.entryIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntriesState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntriesState;
  }

  @override
  void update(void updates(EntriesStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntriesState build() {
    _$EntriesState _$result;
    try {
      _$result = _$v ?? new _$EntriesState._(entryIds: entryIds.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entryIds';
        entryIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntriesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
