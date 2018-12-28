// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_suggestion.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TagSuggestion extends TagSuggestion {
  @override
  final String tag;
  @override
  final int followers;

  factory _$TagSuggestion([void updates(TagSuggestionBuilder b)]) =>
      (new TagSuggestionBuilder()..update(updates)).build();

  _$TagSuggestion._({this.tag, this.followers}) : super._() {
    if (tag == null) {
      throw new BuiltValueNullFieldError('TagSuggestion', 'tag');
    }
    if (followers == null) {
      throw new BuiltValueNullFieldError('TagSuggestion', 'followers');
    }
  }

  @override
  TagSuggestion rebuild(void updates(TagSuggestionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TagSuggestionBuilder toBuilder() => new TagSuggestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagSuggestion &&
        tag == other.tag &&
        followers == other.followers;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, tag.hashCode), followers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TagSuggestion')
          ..add('tag', tag)
          ..add('followers', followers))
        .toString();
  }
}

class TagSuggestionBuilder
    implements Builder<TagSuggestion, TagSuggestionBuilder> {
  _$TagSuggestion _$v;

  String _tag;
  String get tag => _$this._tag;
  set tag(String tag) => _$this._tag = tag;

  int _followers;
  int get followers => _$this._followers;
  set followers(int followers) => _$this._followers = followers;

  TagSuggestionBuilder();

  TagSuggestionBuilder get _$this {
    if (_$v != null) {
      _tag = _$v.tag;
      _followers = _$v.followers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagSuggestion other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TagSuggestion;
  }

  @override
  void update(void updates(TagSuggestionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TagSuggestion build() {
    final _$result =
        _$v ?? new _$TagSuggestion._(tag: tag, followers: followers);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
