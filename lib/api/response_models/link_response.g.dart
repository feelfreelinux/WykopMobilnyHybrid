// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinkResponse> _$linkResponseSerializer =
    new _$LinkResponseSerializer();

class _$LinkResponseSerializer implements StructuredSerializer<LinkResponse> {
  @override
  final Iterable<Type> types = const [LinkResponse, _$LinkResponse];
  @override
  final String wireName = 'LinkResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, LinkResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags, specifiedType: const FullType(String)),
      'source_url',
      serializers.serialize(object.sourceUrl,
          specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'comments_count',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(int)),
      'related_count',
      serializers.serialize(object.relatedCount,
          specifiedType: const FullType(int)),
      'bury_count',
      serializers.serialize(object.buryCount,
          specifiedType: const FullType(int)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(AuthorResponse)),
      'is_hot',
      serializers.serialize(object.isHot, specifiedType: const FullType(bool)),
      'can_vote',
      serializers.serialize(object.canVote,
          specifiedType: const FullType(bool)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.favorite != null) {
      result
        ..add('user_favorite')
        ..add(serializers.serialize(object.favorite,
            specifiedType: const FullType(bool)));
    }
    if (object.userVote != null) {
      result
        ..add('user_vote')
        ..add(serializers.serialize(object.userVote,
            specifiedType: const FullType(String)));
    }
    if (object.preview != null) {
      result
        ..add('preview')
        ..add(serializers.serialize(object.preview,
            specifiedType: const FullType(String)));
    }
    if (object.violationUrl != null) {
      result
        ..add('violation_url')
        ..add(serializers.serialize(object.violationUrl,
            specifiedType: const FullType(String)));
    }
    if (object.app != null) {
      result
        ..add('app')
        ..add(serializers.serialize(object.app,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LinkResponse deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_favorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user_vote':
          result.userVote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source_url':
          result.sourceUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comments_count':
          result.commentsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'related_count':
          result.relatedCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bury_count':
          result.buryCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
        case 'preview':
          result.preview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_hot':
          result.isHot = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'can_vote':
          result.canVote = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'violation_url':
          result.violationUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'app':
          result.app = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LinkResponse extends LinkResponse {
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
  final bool favorite;
  @override
  final String userVote;
  @override
  final String sourceUrl;
  @override
  final int voteCount;
  @override
  final int commentsCount;
  @override
  final int relatedCount;
  @override
  final int buryCount;
  @override
  final AuthorResponse author;
  @override
  final String preview;
  @override
  final bool isHot;
  @override
  final bool canVote;
  @override
  final String violationUrl;
  @override
  final String app;

  factory _$LinkResponse([void Function(LinkResponseBuilder) updates]) =>
      (new LinkResponseBuilder()..update(updates)).build();

  _$LinkResponse._(
      {this.id,
      this.date,
      this.title,
      this.description,
      this.tags,
      this.favorite,
      this.userVote,
      this.sourceUrl,
      this.voteCount,
      this.commentsCount,
      this.relatedCount,
      this.buryCount,
      this.author,
      this.preview,
      this.isHot,
      this.canVote,
      this.violationUrl,
      this.app})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'date');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'title');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'tags');
    }
    if (sourceUrl == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'sourceUrl');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'voteCount');
    }
    if (commentsCount == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'commentsCount');
    }
    if (relatedCount == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'relatedCount');
    }
    if (buryCount == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'buryCount');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'author');
    }
    if (isHot == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'isHot');
    }
    if (canVote == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'canVote');
    }
  }

  @override
  LinkResponse rebuild(void Function(LinkResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkResponseBuilder toBuilder() => new LinkResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkResponse &&
        id == other.id &&
        date == other.date &&
        title == other.title &&
        description == other.description &&
        tags == other.tags &&
        favorite == other.favorite &&
        userVote == other.userVote &&
        sourceUrl == other.sourceUrl &&
        voteCount == other.voteCount &&
        commentsCount == other.commentsCount &&
        relatedCount == other.relatedCount &&
        buryCount == other.buryCount &&
        author == other.author &&
        preview == other.preview &&
        isHot == other.isHot &&
        canVote == other.canVote &&
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        date
                                                                            .hashCode),
                                                                    title
                                                                        .hashCode),
                                                                description
                                                                    .hashCode),
                                                            tags.hashCode),
                                                        favorite.hashCode),
                                                    userVote.hashCode),
                                                sourceUrl.hashCode),
                                            voteCount.hashCode),
                                        commentsCount.hashCode),
                                    relatedCount.hashCode),
                                buryCount.hashCode),
                            author.hashCode),
                        preview.hashCode),
                    isHot.hashCode),
                canVote.hashCode),
            violationUrl.hashCode),
        app.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('title', title)
          ..add('description', description)
          ..add('tags', tags)
          ..add('favorite', favorite)
          ..add('userVote', userVote)
          ..add('sourceUrl', sourceUrl)
          ..add('voteCount', voteCount)
          ..add('commentsCount', commentsCount)
          ..add('relatedCount', relatedCount)
          ..add('buryCount', buryCount)
          ..add('author', author)
          ..add('preview', preview)
          ..add('isHot', isHot)
          ..add('canVote', canVote)
          ..add('violationUrl', violationUrl)
          ..add('app', app))
        .toString();
  }
}

class LinkResponseBuilder
    implements Builder<LinkResponse, LinkResponseBuilder> {
  _$LinkResponse _$v;

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

  bool _favorite;
  bool get favorite => _$this._favorite;
  set favorite(bool favorite) => _$this._favorite = favorite;

  String _userVote;
  String get userVote => _$this._userVote;
  set userVote(String userVote) => _$this._userVote = userVote;

  String _sourceUrl;
  String get sourceUrl => _$this._sourceUrl;
  set sourceUrl(String sourceUrl) => _$this._sourceUrl = sourceUrl;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _commentsCount;
  int get commentsCount => _$this._commentsCount;
  set commentsCount(int commentsCount) => _$this._commentsCount = commentsCount;

  int _relatedCount;
  int get relatedCount => _$this._relatedCount;
  set relatedCount(int relatedCount) => _$this._relatedCount = relatedCount;

  int _buryCount;
  int get buryCount => _$this._buryCount;
  set buryCount(int buryCount) => _$this._buryCount = buryCount;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  bool _isHot;
  bool get isHot => _$this._isHot;
  set isHot(bool isHot) => _$this._isHot = isHot;

  bool _canVote;
  bool get canVote => _$this._canVote;
  set canVote(bool canVote) => _$this._canVote = canVote;

  String _violationUrl;
  String get violationUrl => _$this._violationUrl;
  set violationUrl(String violationUrl) => _$this._violationUrl = violationUrl;

  String _app;
  String get app => _$this._app;
  set app(String app) => _$this._app = app;

  LinkResponseBuilder();

  LinkResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _title = _$v.title;
      _description = _$v.description;
      _tags = _$v.tags;
      _favorite = _$v.favorite;
      _userVote = _$v.userVote;
      _sourceUrl = _$v.sourceUrl;
      _voteCount = _$v.voteCount;
      _commentsCount = _$v.commentsCount;
      _relatedCount = _$v.relatedCount;
      _buryCount = _$v.buryCount;
      _author = _$v.author?.toBuilder();
      _preview = _$v.preview;
      _isHot = _$v.isHot;
      _canVote = _$v.canVote;
      _violationUrl = _$v.violationUrl;
      _app = _$v.app;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinkResponse;
  }

  @override
  void update(void Function(LinkResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LinkResponse build() {
    _$LinkResponse _$result;
    try {
      _$result = _$v ??
          new _$LinkResponse._(
              id: id,
              date: date,
              title: title,
              description: description,
              tags: tags,
              favorite: favorite,
              userVote: userVote,
              sourceUrl: sourceUrl,
              voteCount: voteCount,
              commentsCount: commentsCount,
              relatedCount: relatedCount,
              buryCount: buryCount,
              author: author.build(),
              preview: preview,
              isHot: isHot,
              canVote: canVote,
              violationUrl: violationUrl,
              app: app);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinkResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
