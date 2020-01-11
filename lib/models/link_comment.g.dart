// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LinkComment extends LinkComment {
  @override
  final int id;
  @override
  final String date;
  @override
  final String body;
  @override
  final bool isExpanded;
  @override
  final int voteCount;
  @override
  final int voteCountPlus;
  @override
  final int userVote;
  @override
  final String linkId;
  @override
  final int parentId;
  @override
  final List<LinkComment> children;
  @override
  final LinkCommentVoteState voteState;
  @override
  final bool isBlocked;
  @override
  final Author author;
  @override
  final Embed embed;
  @override
  final String violationUrl;
  @override
  final String app;

  factory _$LinkComment([void Function(LinkCommentBuilder) updates]) =>
      (new LinkCommentBuilder()..update(updates)).build();

  _$LinkComment._(
      {this.id,
      this.date,
      this.body,
      this.isExpanded,
      this.voteCount,
      this.voteCountPlus,
      this.userVote,
      this.linkId,
      this.parentId,
      this.children,
      this.voteState,
      this.isBlocked,
      this.author,
      this.embed,
      this.violationUrl,
      this.app})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'date');
    }
    if (isExpanded == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'isExpanded');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'voteCount');
    }
    if (voteCountPlus == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'voteCountPlus');
    }
    if (userVote == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'userVote');
    }
    if (linkId == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'linkId');
    }
    if (parentId == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'parentId');
    }
    if (children == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'children');
    }
    if (voteState == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'voteState');
    }
    if (isBlocked == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'isBlocked');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('LinkComment', 'author');
    }
  }

  @override
  LinkComment rebuild(void Function(LinkCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkCommentBuilder toBuilder() => new LinkCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkComment &&
        id == other.id &&
        date == other.date &&
        body == other.body &&
        isExpanded == other.isExpanded &&
        voteCount == other.voteCount &&
        voteCountPlus == other.voteCountPlus &&
        userVote == other.userVote &&
        linkId == other.linkId &&
        parentId == other.parentId &&
        children == other.children &&
        voteState == other.voteState &&
        isBlocked == other.isBlocked &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(0,
                                                                    id.hashCode),
                                                                date.hashCode),
                                                            body.hashCode),
                                                        isExpanded.hashCode),
                                                    voteCount.hashCode),
                                                voteCountPlus.hashCode),
                                            userVote.hashCode),
                                        linkId.hashCode),
                                    parentId.hashCode),
                                children.hashCode),
                            voteState.hashCode),
                        isBlocked.hashCode),
                    author.hashCode),
                embed.hashCode),
            violationUrl.hashCode),
        app.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkComment')
          ..add('id', id)
          ..add('date', date)
          ..add('body', body)
          ..add('isExpanded', isExpanded)
          ..add('voteCount', voteCount)
          ..add('voteCountPlus', voteCountPlus)
          ..add('userVote', userVote)
          ..add('linkId', linkId)
          ..add('parentId', parentId)
          ..add('children', children)
          ..add('voteState', voteState)
          ..add('isBlocked', isBlocked)
          ..add('author', author)
          ..add('embed', embed)
          ..add('violationUrl', violationUrl)
          ..add('app', app))
        .toString();
  }
}

class LinkCommentBuilder implements Builder<LinkComment, LinkCommentBuilder> {
  _$LinkComment _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  bool _isExpanded;
  bool get isExpanded => _$this._isExpanded;
  set isExpanded(bool isExpanded) => _$this._isExpanded = isExpanded;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _voteCountPlus;
  int get voteCountPlus => _$this._voteCountPlus;
  set voteCountPlus(int voteCountPlus) => _$this._voteCountPlus = voteCountPlus;

  int _userVote;
  int get userVote => _$this._userVote;
  set userVote(int userVote) => _$this._userVote = userVote;

  String _linkId;
  String get linkId => _$this._linkId;
  set linkId(String linkId) => _$this._linkId = linkId;

  int _parentId;
  int get parentId => _$this._parentId;
  set parentId(int parentId) => _$this._parentId = parentId;

  List<LinkComment> _children;
  List<LinkComment> get children => _$this._children;
  set children(List<LinkComment> children) => _$this._children = children;

  LinkCommentVoteState _voteState;
  LinkCommentVoteState get voteState => _$this._voteState;
  set voteState(LinkCommentVoteState voteState) =>
      _$this._voteState = voteState;

  bool _isBlocked;
  bool get isBlocked => _$this._isBlocked;
  set isBlocked(bool isBlocked) => _$this._isBlocked = isBlocked;

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

  LinkCommentBuilder();

  LinkCommentBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _body = _$v.body;
      _isExpanded = _$v.isExpanded;
      _voteCount = _$v.voteCount;
      _voteCountPlus = _$v.voteCountPlus;
      _userVote = _$v.userVote;
      _linkId = _$v.linkId;
      _parentId = _$v.parentId;
      _children = _$v.children;
      _voteState = _$v.voteState;
      _isBlocked = _$v.isBlocked;
      _author = _$v.author?.toBuilder();
      _embed = _$v.embed?.toBuilder();
      _violationUrl = _$v.violationUrl;
      _app = _$v.app;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkComment other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinkComment;
  }

  @override
  void update(void Function(LinkCommentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LinkComment build() {
    _$LinkComment _$result;
    try {
      _$result = _$v ??
          new _$LinkComment._(
              id: id,
              date: date,
              body: body,
              isExpanded: isExpanded,
              voteCount: voteCount,
              voteCountPlus: voteCountPlus,
              userVote: userVote,
              linkId: linkId,
              parentId: parentId,
              children: children,
              voteState: voteState,
              isBlocked: isBlocked,
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
            'LinkComment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
