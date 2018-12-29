// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SuggestionsState> _$suggestionsStateSerializer =
    new _$SuggestionsStateSerializer();

class _$SuggestionsStateSerializer
    implements StructuredSerializer<SuggestionsState> {
  @override
  final Iterable<Type> types = const [SuggestionsState, _$SuggestionsState];
  @override
  final String wireName = 'SuggestionsState';

  @override
  Iterable serialize(Serializers serializers, SuggestionsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'authorSuggestions',
      serializers.serialize(object.authorSuggestions,
          specifiedType:
              const FullType(List, const [const FullType(AuthorSuggestion)])),
      'tagSuggestions',
      serializers.serialize(object.tagSuggestions,
          specifiedType:
              const FullType(List, const [const FullType(TagSuggestion)])),
    ];

    return result;
  }

  @override
  SuggestionsState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SuggestionsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'authorSuggestions':
          result.authorSuggestions = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(AuthorSuggestion)]))
              as List<AuthorSuggestion>;
          break;
        case 'tagSuggestions':
          result.tagSuggestions = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(TagSuggestion)]))
              as List<TagSuggestion>;
          break;
      }
    }

    return result.build();
  }
}

class _$SuggestionsState extends SuggestionsState {
  @override
  final List<AuthorSuggestion> authorSuggestions;
  @override
  final List<TagSuggestion> tagSuggestions;

  factory _$SuggestionsState([void updates(SuggestionsStateBuilder b)]) =>
      (new SuggestionsStateBuilder()..update(updates)).build();

  _$SuggestionsState._({this.authorSuggestions, this.tagSuggestions})
      : super._() {
    if (authorSuggestions == null) {
      throw new BuiltValueNullFieldError(
          'SuggestionsState', 'authorSuggestions');
    }
    if (tagSuggestions == null) {
      throw new BuiltValueNullFieldError('SuggestionsState', 'tagSuggestions');
    }
  }

  @override
  SuggestionsState rebuild(void updates(SuggestionsStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestionsStateBuilder toBuilder() =>
      new SuggestionsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuggestionsState &&
        authorSuggestions == other.authorSuggestions &&
        tagSuggestions == other.tagSuggestions;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, authorSuggestions.hashCode), tagSuggestions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SuggestionsState')
          ..add('authorSuggestions', authorSuggestions)
          ..add('tagSuggestions', tagSuggestions))
        .toString();
  }
}

class SuggestionsStateBuilder
    implements Builder<SuggestionsState, SuggestionsStateBuilder> {
  _$SuggestionsState _$v;

  List<AuthorSuggestion> _authorSuggestions;
  List<AuthorSuggestion> get authorSuggestions => _$this._authorSuggestions;
  set authorSuggestions(List<AuthorSuggestion> authorSuggestions) =>
      _$this._authorSuggestions = authorSuggestions;

  List<TagSuggestion> _tagSuggestions;
  List<TagSuggestion> get tagSuggestions => _$this._tagSuggestions;
  set tagSuggestions(List<TagSuggestion> tagSuggestions) =>
      _$this._tagSuggestions = tagSuggestions;

  SuggestionsStateBuilder();

  SuggestionsStateBuilder get _$this {
    if (_$v != null) {
      _authorSuggestions = _$v.authorSuggestions;
      _tagSuggestions = _$v.tagSuggestions;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuggestionsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SuggestionsState;
  }

  @override
  void update(void updates(SuggestionsStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SuggestionsState build() {
    final _$result = _$v ??
        new _$SuggestionsState._(
            authorSuggestions: authorSuggestions,
            tagSuggestions: tagSuggestions);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
