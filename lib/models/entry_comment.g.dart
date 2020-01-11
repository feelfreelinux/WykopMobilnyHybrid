// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EntryComment extends EntryComment {
  @override
  final int id;
  @override
  final String date;
  @override
  final String body;
  @override
  final int voteCount;
  @override
  final bool isVoted;
  @override
  final bool isExpanded;
  @override
  final Author author;
  @override
  final Embed embed;
  @override
  final String violationUrl;
  @override
  final String app;

  factory _$EntryComment([void Function(EntryCommentBuilder) updates]) =>
      (new EntryCommentBuilder()..update(updates)).build();

  _$EntryComment._(
      {this.id,
      this.date,
      this.body,
      this.voteCount,
      this.isVoted,
      this.isExpanded,
      this.author,
      this.embed,
      this.violationUrl,
      this.app})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('EntryComment', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('EntryComment', 'date');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('EntryComment', 'voteCount');
    }
    if (isVoted == null) {
      throw new BuiltValueNullFieldError('EntryComment', 'isVoted');
    }
    if (isExpanded == null) {
      throw new BuiltValueNullFieldError('EntryComment', 'isExpanded');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('EntryComment', 'author');
    }
  }

  @override
  EntryComment rebuild(void Function(EntryCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryCommentBuilder toBuilder() => new EntryCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryComment &&
        id == other.id &&
        date == other.date &&
        body == other.body &&
        voteCount == other.voteCount &&
        isVoted == other.isVoted &&
        isExpanded == other.isExpanded &&
        author == other.author &&
        embed == other.embed &&
        violationUrl == other.violationUrl &&
        app == other.app;
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
                            isVoted.hashCode),
                        isExpanded.hashCode),
                    author.hashCode),
                embed.hashCode),
            violationUrl.hashCode),
        app.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryComment')
          ..add('id', id)
          ..add('date', date)
          ..add('body', body)
          ..add('voteCount', voteCount)
          ..add('isVoted', isVoted)
          ..add('isExpanded', isExpanded)
          ..add('author', author)
          ..add('embed', embed)
          ..add('violationUrl', violationUrl)
          ..add('app', app))
        .toString();
  }
}

class EntryCommentBuilder
    implements Builder<EntryComment, EntryCommentBuilder> {
  _$EntryComment _$v;

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

  bool _isVoted;
  bool get isVoted => _$this._isVoted;
  set isVoted(bool isVoted) => _$this._isVoted = isVoted;

  bool _isExpanded;
  bool get isExpanded => _$this._isExpanded;
  set isExpanded(bool isExpanded) => _$this._isExpanded = isExpanded;

  AuthorBuilder _author;
  AuthorBuilder get author => _$this._author ??= new AuthorBuilder();
  set author(AuthorBuilder author) => _$this._author = author;

  EmbedBuilder _embed;
  EmbedBuilder get embed => _$this._embed ??= new EmbedBuilder();
  set embed(EmbedBuilder embed) => _$this._embed = embed;

  String _violationUrl;
  String get violationUrl => _$this._violationUrl;
  set violationUrl(String violationUrl) => _$this._violationUrl = violationUrl;

  String _app;
  String get app => _$this._app;
  set app(String app) => _$this._app = app;

  EntryCommentBuilder();

  EntryCommentBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _body = _$v.body;
      _voteCount = _$v.voteCount;
      _isVoted = _$v.isVoted;
      _isExpanded = _$v.isExpanded;
      _author = _$v.author?.toBuilder();
      _embed = _$v.embed?.toBuilder();
      _violationUrl = _$v.violationUrl;
      _app = _$v.app;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryComment other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryComment;
  }

  @override
  void update(void Function(EntryCommentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryComment build() {
    _$EntryComment _$result;
    try {
      _$result = _$v ??
          new _$EntryComment._(
              id: id,
              date: date,
              body: body,
              voteCount: voteCount,
              isVoted: isVoted,
              isExpanded: isExpanded,
              author: author.build(),
              embed: _embed?.build(),
              violationUrl: violationUrl,
              app: app);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
        _$failedField = 'embed';
        _embed?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryComment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
