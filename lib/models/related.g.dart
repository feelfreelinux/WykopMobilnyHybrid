// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Related extends Related {
  @override
  final int id;
  @override
  final String url;
  @override
  final String title;
  @override
  final int voteCount;
  @override
  final bool isVoted;
  @override
  final Author author;

  factory _$Related([void Function(RelatedBuilder) updates]) =>
      (new RelatedBuilder()..update(updates)).build();

  _$Related._(
      {this.id,
      this.url,
      this.title,
      this.voteCount,
      this.isVoted,
      this.author})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Related', 'id');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Related', 'url');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Related', 'title');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('Related', 'voteCount');
    }
    if (isVoted == null) {
      throw new BuiltValueNullFieldError('Related', 'isVoted');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('Related', 'author');
    }
  }

  @override
  Related rebuild(void Function(RelatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RelatedBuilder toBuilder() => new RelatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Related &&
        id == other.id &&
        url == other.url &&
        title == other.title &&
        voteCount == other.voteCount &&
        isVoted == other.isVoted &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), url.hashCode), title.hashCode),
                voteCount.hashCode),
            isVoted.hashCode),
        author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Related')
          ..add('id', id)
          ..add('url', url)
          ..add('title', title)
          ..add('voteCount', voteCount)
          ..add('isVoted', isVoted)
          ..add('author', author))
        .toString();
  }
}

class RelatedBuilder implements Builder<Related, RelatedBuilder> {
  _$Related _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  bool _isVoted;
  bool get isVoted => _$this._isVoted;
  set isVoted(bool isVoted) => _$this._isVoted = isVoted;

  AuthorBuilder _author;
  AuthorBuilder get author => _$this._author ??= new AuthorBuilder();
  set author(AuthorBuilder author) => _$this._author = author;

  RelatedBuilder();

  RelatedBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _url = _$v.url;
      _title = _$v.title;
      _voteCount = _$v.voteCount;
      _isVoted = _$v.isVoted;
      _author = _$v.author?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Related other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Related;
  }

  @override
  void update(void Function(RelatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Related build() {
    _$Related _$result;
    try {
      _$result = _$v ??
          new _$Related._(
              id: id,
              url: url,
              title: title,
              voteCount: voteCount,
              isVoted: isVoted,
              author: author.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Related', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
