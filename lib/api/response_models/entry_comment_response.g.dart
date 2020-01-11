// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_comment_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntryCommentResponse> _$entryCommentResponseSerializer =
    new _$EntryCommentResponseSerializer();

class _$EntryCommentResponseSerializer
    implements StructuredSerializer<EntryCommentResponse> {
  @override
  final Iterable<Type> types = const [
    EntryCommentResponse,
    _$EntryCommentResponse
  ];
  @override
  final String wireName = 'EntryCommentResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, EntryCommentResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
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
    if (object.app != null) {
      result
        ..add('app')
        ..add(serializers.serialize(object.app,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EntryCommentResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryCommentResponseBuilder();

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
        case 'app':
          result.app = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EntryCommentResponse extends EntryCommentResponse {
  @override
  final int id;
  @override
  final String date;
  @override
  final String body;
  @override
  final int userVote;
  @override
  final int voteCount;
  @override
  final AuthorResponse author;
  @override
  final EmbedResponse embed;
  @override
  final String violationUrl;
  @override
  final String app;

  factory _$EntryCommentResponse(
          [void Function(EntryCommentResponseBuilder) updates]) =>
      (new EntryCommentResponseBuilder()..update(updates)).build();

  _$EntryCommentResponse._(
      {this.id,
      this.date,
      this.body,
      this.userVote,
      this.voteCount,
      this.author,
      this.embed,
      this.violationUrl,
      this.app})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('EntryCommentResponse', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('EntryCommentResponse', 'date');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('EntryCommentResponse', 'voteCount');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('EntryCommentResponse', 'author');
    }
  }

  @override
  EntryCommentResponse rebuild(
          void Function(EntryCommentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryCommentResponseBuilder toBuilder() =>
      new EntryCommentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryCommentResponse &&
        id == other.id &&
        date == other.date &&
        body == other.body &&
        userVote == other.userVote &&
        voteCount == other.voteCount &&
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
                            $jc($jc($jc(0, id.hashCode), date.hashCode),
                                body.hashCode),
                            userVote.hashCode),
                        voteCount.hashCode),
                    author.hashCode),
                embed.hashCode),
            violationUrl.hashCode),
        app.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryCommentResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('body', body)
          ..add('userVote', userVote)
          ..add('voteCount', voteCount)
          ..add('author', author)
          ..add('embed', embed)
          ..add('violationUrl', violationUrl)
          ..add('app', app))
        .toString();
  }
}

class EntryCommentResponseBuilder
    implements Builder<EntryCommentResponse, EntryCommentResponseBuilder> {
  _$EntryCommentResponse _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

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

  String _app;
  String get app => _$this._app;
  set app(String app) => _$this._app = app;

  EntryCommentResponseBuilder();

  EntryCommentResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _body = _$v.body;
      _userVote = _$v.userVote;
      _voteCount = _$v.voteCount;
      _author = _$v.author?.toBuilder();
      _embed = _$v.embed?.toBuilder();
      _violationUrl = _$v.violationUrl;
      _app = _$v.app;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryCommentResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryCommentResponse;
  }

  @override
  void update(void Function(EntryCommentResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryCommentResponse build() {
    _$EntryCommentResponse _$result;
    try {
      _$result = _$v ??
          new _$EntryCommentResponse._(
              id: id,
              date: date,
              body: body,
              userVote: userVote,
              voteCount: voteCount,
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
            'EntryCommentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
