// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Entry extends Entry {
  @override
  final int id;
  @override
  final String date;
  @override
  final String body;
  @override
  final int voteCount;
  @override
  final int commentsCount;
  @override
  final bool isVoted;
  @override
  final bool isFavorite;
  @override
  final BuiltList<EntryComment> comments;
  @override
  final Author author;
  @override
  final Embed embed;

  factory _$Entry([void Function(EntryBuilder) updates]) =>
      (new EntryBuilder()..update(updates)).build();

  _$Entry._(
      {this.id,
      this.date,
      this.body,
      this.voteCount,
      this.commentsCount,
      this.isVoted,
      this.isFavorite,
      this.comments,
      this.author,
      this.embed})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Entry', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('Entry', 'date');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('Entry', 'voteCount');
    }
    if (commentsCount == null) {
      throw new BuiltValueNullFieldError('Entry', 'commentsCount');
    }
    if (isVoted == null) {
      throw new BuiltValueNullFieldError('Entry', 'isVoted');
    }
    if (isFavorite == null) {
      throw new BuiltValueNullFieldError('Entry', 'isFavorite');
    }
    if (comments == null) {
      throw new BuiltValueNullFieldError('Entry', 'comments');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('Entry', 'author');
    }
  }

  @override
  Entry rebuild(void Function(EntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryBuilder toBuilder() => new EntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Entry &&
        id == other.id &&
        date == other.date &&
        body == other.body &&
        voteCount == other.voteCount &&
        commentsCount == other.commentsCount &&
        isVoted == other.isVoted &&
        isFavorite == other.isFavorite &&
        comments == other.comments &&
        author == other.author &&
        embed == other.embed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, id.hashCode), date.hashCode),
                                    body.hashCode),
                                voteCount.hashCode),
                            commentsCount.hashCode),
                        isVoted.hashCode),
                    isFavorite.hashCode),
                comments.hashCode),
            author.hashCode),
        embed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Entry')
          ..add('id', id)
          ..add('date', date)
          ..add('body', body)
          ..add('voteCount', voteCount)
          ..add('commentsCount', commentsCount)
          ..add('isVoted', isVoted)
          ..add('isFavorite', isFavorite)
          ..add('comments', comments)
          ..add('author', author)
          ..add('embed', embed))
        .toString();
  }
}

class EntryBuilder implements Builder<Entry, EntryBuilder> {
  _$Entry _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _commentsCount;
  int get commentsCount => _$this._commentsCount;
  set commentsCount(int commentsCount) => _$this._commentsCount = commentsCount;

  bool _isVoted;
  bool get isVoted => _$this._isVoted;
  set isVoted(bool isVoted) => _$this._isVoted = isVoted;

  bool _isFavorite;
  bool get isFavorite => _$this._isFavorite;
  set isFavorite(bool isFavorite) => _$this._isFavorite = isFavorite;

  ListBuilder<EntryComment> _comments;
  ListBuilder<EntryComment> get comments =>
      _$this._comments ??= new ListBuilder<EntryComment>();
  set comments(ListBuilder<EntryComment> comments) =>
      _$this._comments = comments;

  AuthorBuilder _author;
  AuthorBuilder get author => _$this._author ??= new AuthorBuilder();
  set author(AuthorBuilder author) => _$this._author = author;

  EmbedBuilder _embed;
  EmbedBuilder get embed => _$this._embed ??= new EmbedBuilder();
  set embed(EmbedBuilder embed) => _$this._embed = embed;

  EntryBuilder();

  EntryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _body = _$v.body;
      _voteCount = _$v.voteCount;
      _commentsCount = _$v.commentsCount;
      _isVoted = _$v.isVoted;
      _isFavorite = _$v.isFavorite;
      _comments = _$v.comments?.toBuilder();
      _author = _$v.author?.toBuilder();
      _embed = _$v.embed?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Entry other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Entry;
  }

  @override
  void update(void Function(EntryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Entry build() {
    _$Entry _$result;
    try {
      _$result = _$v ??
          new _$Entry._(
              id: id,
              date: date,
              body: body,
              voteCount: voteCount,
              commentsCount: commentsCount,
              isVoted: isVoted,
              isFavorite: isFavorite,
              comments: comments.build(),
              author: author.build(),
              embed: _embed?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'author';
        author.build();
        _$failedField = 'embed';
        _embed?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Entry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
