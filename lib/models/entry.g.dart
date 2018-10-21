// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

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

class _$Entry extends Entry {
  @override
  final num id;
  @override
  final String date;
  @override
  final String body;
  @override
  final num voteCount;
  @override
  final num commentsCount;
  @override
  final Author author;
  @override
  final Embed embed;

  factory _$Entry([void updates(EntryBuilder b)]) =>
      (new EntryBuilder()..update(updates)).build();

  _$Entry._(
      {this.id,
      this.date,
      this.body,
      this.voteCount,
      this.commentsCount,
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
    if (author == null) {
      throw new BuiltValueNullFieldError('Entry', 'author');
    }
  }

  @override
  Entry rebuild(void updates(EntryBuilder b)) =>
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
        author == other.author &&
        embed == other.embed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc($jc(0, id.hashCode), date.hashCode), body.hashCode),
                    voteCount.hashCode),
                commentsCount.hashCode),
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
          ..add('author', author)
          ..add('embed', embed))
        .toString();
  }
}

class EntryBuilder implements Builder<Entry, EntryBuilder> {
  _$Entry _$v;

  num _id;
  num get id => _$this._id;
  set id(num id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  num _voteCount;
  num get voteCount => _$this._voteCount;
  set voteCount(num voteCount) => _$this._voteCount = voteCount;

  num _commentsCount;
  num get commentsCount => _$this._commentsCount;
  set commentsCount(num commentsCount) => _$this._commentsCount = commentsCount;

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
  void update(void updates(EntryBuilder b)) {
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
              author: author.build(),
              embed: _embed?.build());
    } catch (_) {
      String _$failedField;
      try {
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
