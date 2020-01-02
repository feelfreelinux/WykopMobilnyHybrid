// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_comment_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinkCommentResponse> _$linkCommentResponseSerializer =
    new _$LinkCommentResponseSerializer();

class _$LinkCommentResponseSerializer
    implements StructuredSerializer<LinkCommentResponse> {
  @override
  final Iterable<Type> types = const [
    LinkCommentResponse,
    _$LinkCommentResponse
  ];
  @override
  final String wireName = 'LinkCommentResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, LinkCommentResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'link_id',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'vote_count_plus',
      serializers.serialize(object.voteCountPlus,
          specifiedType: const FullType(int)),
      'parent_id',
      serializers.serialize(object.parentId,
          specifiedType: const FullType(int)),
      'blocked',
      serializers.serialize(object.isBlocked,
          specifiedType: const FullType(bool)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(AuthorResponse)),
    ];
    if (object.body != null) {
      result
        ..add('body')
        ..add(serializers.serialize(object.body,
            specifiedType: const FullType(String)));
    }
    if (object.userVote != null) {
      result
        ..add('user_vote')
        ..add(serializers.serialize(object.userVote,
            specifiedType: const FullType(int)));
    }
    if (object.embed != null) {
      result
        ..add('embed')
        ..add(serializers.serialize(object.embed,
            specifiedType: const FullType(EmbedResponse)));
    }
    if (object.violationUrl != null) {
      result
        ..add('violation_url')
        ..add(serializers.serialize(object.violationUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LinkCommentResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkCommentResponseBuilder();

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
        case 'link_id':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_vote':
          result.userVote = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'vote_count_plus':
          result.voteCountPlus = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'parent_id':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'blocked':
          result.isBlocked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
        case 'embed':
          result.embed.replace(serializers.deserialize(value,
              specifiedType: const FullType(EmbedResponse)) as EmbedResponse);
          break;
        case 'violation_url':
          result.violationUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LinkCommentResponse extends LinkCommentResponse {
  @override
  final int id;
  @override
  final String link;
  @override
  final String date;
  @override
  final String body;
  @override
  final int userVote;
  @override
  final int voteCount;
  @override
  final int voteCountPlus;
  @override
  final int parentId;
  @override
  final bool isBlocked;
  @override
  final AuthorResponse author;
  @override
  final EmbedResponse embed;
  @override
  final String violationUrl;

  factory _$LinkCommentResponse(
          [void Function(LinkCommentResponseBuilder) updates]) =>
      (new LinkCommentResponseBuilder()..update(updates)).build();

  _$LinkCommentResponse._(
      {this.id,
      this.link,
      this.date,
      this.body,
      this.userVote,
      this.voteCount,
      this.voteCountPlus,
      this.parentId,
      this.isBlocked,
      this.author,
      this.embed,
      this.violationUrl})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('LinkCommentResponse', 'id');
    }
    if (link == null) {
      throw new BuiltValueNullFieldError('LinkCommentResponse', 'link');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('LinkCommentResponse', 'date');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('LinkCommentResponse', 'voteCount');
    }
    if (voteCountPlus == null) {
      throw new BuiltValueNullFieldError(
          'LinkCommentResponse', 'voteCountPlus');
    }
    if (parentId == null) {
      throw new BuiltValueNullFieldError('LinkCommentResponse', 'parentId');
    }
    if (isBlocked == null) {
      throw new BuiltValueNullFieldError('LinkCommentResponse', 'isBlocked');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('LinkCommentResponse', 'author');
    }
  }

  @override
  LinkCommentResponse rebuild(
          void Function(LinkCommentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkCommentResponseBuilder toBuilder() =>
      new LinkCommentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkCommentResponse &&
        id == other.id &&
        link == other.link &&
        date == other.date &&
        body == other.body &&
        userVote == other.userVote &&
        voteCount == other.voteCount &&
        voteCountPlus == other.voteCountPlus &&
        parentId == other.parentId &&
        isBlocked == other.isBlocked &&
        author == other.author &&
        embed == other.embed &&
        violationUrl == other.violationUrl;
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
                                            $jc($jc(0, id.hashCode),
                                                link.hashCode),
                                            date.hashCode),
                                        body.hashCode),
                                    userVote.hashCode),
                                voteCount.hashCode),
                            voteCountPlus.hashCode),
                        parentId.hashCode),
                    isBlocked.hashCode),
                author.hashCode),
            embed.hashCode),
        violationUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkCommentResponse')
          ..add('id', id)
          ..add('link', link)
          ..add('date', date)
          ..add('body', body)
          ..add('userVote', userVote)
          ..add('voteCount', voteCount)
          ..add('voteCountPlus', voteCountPlus)
          ..add('parentId', parentId)
          ..add('isBlocked', isBlocked)
          ..add('author', author)
          ..add('embed', embed)
          ..add('violationUrl', violationUrl))
        .toString();
  }
}

class LinkCommentResponseBuilder
    implements Builder<LinkCommentResponse, LinkCommentResponseBuilder> {
  _$LinkCommentResponse _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  int _userVote;
  int get userVote => _$this._userVote;
  set userVote(int userVote) => _$this._userVote = userVote;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _voteCountPlus;
  int get voteCountPlus => _$this._voteCountPlus;
  set voteCountPlus(int voteCountPlus) => _$this._voteCountPlus = voteCountPlus;

  int _parentId;
  int get parentId => _$this._parentId;
  set parentId(int parentId) => _$this._parentId = parentId;

  bool _isBlocked;
  bool get isBlocked => _$this._isBlocked;
  set isBlocked(bool isBlocked) => _$this._isBlocked = isBlocked;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  EmbedResponseBuilder _embed;
  EmbedResponseBuilder get embed =>
      _$this._embed ??= new EmbedResponseBuilder();
  set embed(EmbedResponseBuilder embed) => _$this._embed = embed;

  String _violationUrl;
  String get violationUrl => _$this._violationUrl;
  set violationUrl(String violationUrl) => _$this._violationUrl = violationUrl;

  LinkCommentResponseBuilder();

  LinkCommentResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _link = _$v.link;
      _date = _$v.date;
      _body = _$v.body;
      _userVote = _$v.userVote;
      _voteCount = _$v.voteCount;
      _voteCountPlus = _$v.voteCountPlus;
      _parentId = _$v.parentId;
      _isBlocked = _$v.isBlocked;
      _author = _$v.author?.toBuilder();
      _embed = _$v.embed?.toBuilder();
      _violationUrl = _$v.violationUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkCommentResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinkCommentResponse;
  }

  @override
  void update(void Function(LinkCommentResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LinkCommentResponse build() {
    _$LinkCommentResponse _$result;
    try {
      _$result = _$v ??
          new _$LinkCommentResponse._(
              id: id,
              link: link,
              date: date,
              body: body,
              userVote: userVote,
              voteCount: voteCount,
              voteCountPlus: voteCountPlus,
              parentId: parentId,
              isBlocked: isBlocked,
              author: author.build(),
              embed: _embed?.build(),
              violationUrl: violationUrl);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
        _$failedField = 'embed';
        _embed?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinkCommentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
