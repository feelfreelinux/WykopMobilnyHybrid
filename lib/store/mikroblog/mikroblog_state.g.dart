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
      'entries',
      serializers.serialize(object.entries,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Entry)])),
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(num)),
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
        case 'entries':
          result.entries.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Entry)]))
              as BuiltList);
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
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

class _$MikroblogState extends MikroblogState {
  @override
  final BuiltList<Entry> entries;
  @override
  final bool isLoading;
  @override
  final num page;

  factory _$MikroblogState([void updates(MikroblogStateBuilder b)]) =>
      (new MikroblogStateBuilder()..update(updates)).build();

  _$MikroblogState._({this.entries, this.isLoading, this.page}) : super._() {
    if (entries == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'entries');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'isLoading');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('MikroblogState', 'page');
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
        entries == other.entries &&
        isLoading == other.isLoading &&
        page == other.page;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, entries.hashCode), isLoading.hashCode), page.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MikroblogState')
          ..add('entries', entries)
          ..add('isLoading', isLoading)
          ..add('page', page))
        .toString();
  }
}

class MikroblogStateBuilder
    implements Builder<MikroblogState, MikroblogStateBuilder> {
  _$MikroblogState _$v;

  ListBuilder<Entry> _entries;
  ListBuilder<Entry> get entries =>
      _$this._entries ??= new ListBuilder<Entry>();
  set entries(ListBuilder<Entry> entries) => _$this._entries = entries;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  num _page;
  num get page => _$this._page;
  set page(num page) => _$this._page = page;

  MikroblogStateBuilder();

  MikroblogStateBuilder get _$this {
    if (_$v != null) {
      _entries = _$v.entries?.toBuilder();
      _isLoading = _$v.isLoading;
      _page = _$v.page;
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
              entries: entries.build(), isLoading: isLoading, page: page);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entries';
        entries.build();
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
