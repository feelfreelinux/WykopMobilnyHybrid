// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Link extends Link {
  @override
  final int id;
  @override
  final String date;
  @override
  final String title;
  @override
  final String description;
  @override
  final String tags;
  @override
  final String sourceUrl;
  @override
  final int voteCount;
  @override
  final int buryCount;
  @override
  final bool isFavorite;
  @override
  final int commentsCount;
  @override
  final int relatedCount;
  @override
  final LinkVoteState voteState;
  @override
  final Author author;
  @override
  final String preview;
  @override
  final bool isHot;
  @override
  final bool isExpanded;
  @override
  final bool canVote;

  factory _$Link([void Function(LinkBuilder) updates]) =>
      (new LinkBuilder()..update(updates)).build();

  _$Link._(
      {this.id,
      this.date,
      this.title,
      this.description,
      this.tags,
      this.sourceUrl,
      this.voteCount,
      this.buryCount,
      this.isFavorite,
      this.commentsCount,
      this.relatedCount,
      this.voteState,
      this.author,
      this.preview,
      this.isHot,
      this.isExpanded,
      this.canVote})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Link', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('Link', 'date');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Link', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Link', 'description');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('Link', 'tags');
    }
    if (sourceUrl == null) {
      throw new BuiltValueNullFieldError('Link', 'sourceUrl');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('Link', 'voteCount');
    }
    if (buryCount == null) {
      throw new BuiltValueNullFieldError('Link', 'buryCount');
    }
    if (isFavorite == null) {
      throw new BuiltValueNullFieldError('Link', 'isFavorite');
    }
    if (commentsCount == null) {
      throw new BuiltValueNullFieldError('Link', 'commentsCount');
    }
    if (relatedCount == null) {
      throw new BuiltValueNullFieldError('Link', 'relatedCount');
    }
    if (voteState == null) {
      throw new BuiltValueNullFieldError('Link', 'voteState');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('Link', 'author');
    }
    if (isHot == null) {
      throw new BuiltValueNullFieldError('Link', 'isHot');
    }
    if (isExpanded == null) {
      throw new BuiltValueNullFieldError('Link', 'isExpanded');
    }
    if (canVote == null) {
      throw new BuiltValueNullFieldError('Link', 'canVote');
    }
  }

  @override
  Link rebuild(void Function(LinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkBuilder toBuilder() => new LinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Link &&
        id == other.id &&
        date == other.date &&
        title == other.title &&
        description == other.description &&
        tags == other.tags &&
        sourceUrl == other.sourceUrl &&
        voteCount == other.voteCount &&
        buryCount == other.buryCount &&
        isFavorite == other.isFavorite &&
        commentsCount == other.commentsCount &&
        relatedCount == other.relatedCount &&
        voteState == other.voteState &&
        author == other.author &&
        preview == other.preview &&
        isHot == other.isHot &&
        isExpanded == other.isExpanded &&
        canVote == other.canVote;
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
                                                                $jc(
                                                                    $jc(0,
                                                                        id.hashCode),
                                                                    date.hashCode),
                                                                title.hashCode),
                                                            description.hashCode),
                                                        tags.hashCode),
                                                    sourceUrl.hashCode),
                                                voteCount.hashCode),
                                            buryCount.hashCode),
                                        isFavorite.hashCode),
                                    commentsCount.hashCode),
                                relatedCount.hashCode),
                            voteState.hashCode),
                        author.hashCode),
                    preview.hashCode),
                isHot.hashCode),
            isExpanded.hashCode),
        canVote.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Link')
          ..add('id', id)
          ..add('date', date)
          ..add('title', title)
          ..add('description', description)
          ..add('tags', tags)
          ..add('sourceUrl', sourceUrl)
          ..add('voteCount', voteCount)
          ..add('buryCount', buryCount)
          ..add('isFavorite', isFavorite)
          ..add('commentsCount', commentsCount)
          ..add('relatedCount', relatedCount)
          ..add('voteState', voteState)
          ..add('author', author)
          ..add('preview', preview)
          ..add('isHot', isHot)
          ..add('isExpanded', isExpanded)
          ..add('canVote', canVote))
        .toString();
  }
}

class LinkBuilder implements Builder<Link, LinkBuilder> {
  _$Link _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _tags;
  String get tags => _$this._tags;
  set tags(String tags) => _$this._tags = tags;

  String _sourceUrl;
  String get sourceUrl => _$this._sourceUrl;
  set sourceUrl(String sourceUrl) => _$this._sourceUrl = sourceUrl;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _buryCount;
  int get buryCount => _$this._buryCount;
  set buryCount(int buryCount) => _$this._buryCount = buryCount;

  bool _isFavorite;
  bool get isFavorite => _$this._isFavorite;
  set isFavorite(bool isFavorite) => _$this._isFavorite = isFavorite;

  int _commentsCount;
  int get commentsCount => _$this._commentsCount;
  set commentsCount(int commentsCount) => _$this._commentsCount = commentsCount;

  int _relatedCount;
  int get relatedCount => _$this._relatedCount;
  set relatedCount(int relatedCount) => _$this._relatedCount = relatedCount;

  LinkVoteState _voteState;
  LinkVoteState get voteState => _$this._voteState;
  set voteState(LinkVoteState voteState) => _$this._voteState = voteState;

  AuthorBuilder _author;
  AuthorBuilder get author => _$this._author ??= new AuthorBuilder();
  set author(AuthorBuilder author) => _$this._author = author;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  bool _isHot;
  bool get isHot => _$this._isHot;
  set isHot(bool isHot) => _$this._isHot = isHot;

  bool _isExpanded;
  bool get isExpanded => _$this._isExpanded;
  set isExpanded(bool isExpanded) => _$this._isExpanded = isExpanded;

  bool _canVote;
  bool get canVote => _$this._canVote;
  set canVote(bool canVote) => _$this._canVote = canVote;

  LinkBuilder();

  LinkBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _title = _$v.title;
      _description = _$v.description;
      _tags = _$v.tags;
      _sourceUrl = _$v.sourceUrl;
      _voteCount = _$v.voteCount;
      _buryCount = _$v.buryCount;
      _isFavorite = _$v.isFavorite;
      _commentsCount = _$v.commentsCount;
      _relatedCount = _$v.relatedCount;
      _voteState = _$v.voteState;
      _author = _$v.author?.toBuilder();
      _preview = _$v.preview;
      _isHot = _$v.isHot;
      _isExpanded = _$v.isExpanded;
      _canVote = _$v.canVote;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Link other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Link;
  }

  @override
  void update(void Function(LinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Link build() {
    _$Link _$result;
    try {
      _$result = _$v ??
          new _$Link._(
              id: id,
              date: date,
              title: title,
              description: description,
              tags: tags,
              sourceUrl: sourceUrl,
              voteCount: voteCount,
              buryCount: buryCount,
              isFavorite: isFavorite,
              commentsCount: commentsCount,
              relatedCount: relatedCount,
              voteState: voteState,
              author: author.build(),
              preview: preview,
              isHot: isHot,
              isExpanded: isExpanded,
              canVote: canVote);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Link', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
