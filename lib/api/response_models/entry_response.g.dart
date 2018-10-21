// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_response.dart';

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

Serializer<EntryResponse> _$entryResponseSerializer =
    new _$EntryResponseSerializer();
Serializer<EntryAuthor> _$entryAuthorSerializer = new _$EntryAuthorSerializer();
Serializer<EntryEmbed> _$entryEmbedSerializer = new _$EntryEmbedSerializer();

class _$EntryResponseSerializer implements StructuredSerializer<EntryResponse> {
  @override
  final Iterable<Type> types = const [EntryResponse, _$EntryResponse];
  @override
  final String wireName = 'EntryResponse';

  @override
  Iterable serialize(Serializers serializers, EntryResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(num)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(num)),
      'comments_count',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(num)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(EntryAuthor)),
    ];
    if (object.body != null) {
      result
        ..add('body')
        ..add(serializers.serialize(object.body,
            specifiedType: const FullType(String)));
    }
    if (object.embed != null) {
      result
        ..add('embed')
        ..add(serializers.serialize(object.embed,
            specifiedType: const FullType(EntryEmbed)));
    }

    return result;
  }

  @override
  EntryResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'comments_count':
          result.commentsCount = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntryAuthor)) as EntryAuthor);
          break;
        case 'embed':
          result.embed.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntryEmbed)) as EntryEmbed);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryAuthorSerializer implements StructuredSerializer<EntryAuthor> {
  @override
  final Iterable<Type> types = const [EntryAuthor, _$EntryAuthor];
  @override
  final String wireName = 'EntryAuthor';

  @override
  Iterable serialize(Serializers serializers, EntryAuthor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(num)),
      'avatar',
      serializers.serialize(object.avatar,
          specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EntryAuthor deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryAuthorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EntryEmbedSerializer implements StructuredSerializer<EntryEmbed> {
  @override
  final Iterable<Type> types = const [EntryEmbed, _$EntryEmbed];
  @override
  final String wireName = 'EntryEmbed';

  @override
  Iterable serialize(Serializers serializers, EntryEmbed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'preview',
      serializers.serialize(object.preview,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EntryEmbed deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryEmbedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'preview':
          result.preview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EntryResponse extends EntryResponse {
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
  final EntryAuthor author;
  @override
  final EntryEmbed embed;

  factory _$EntryResponse([void updates(EntryResponseBuilder b)]) =>
      (new EntryResponseBuilder()..update(updates)).build();

  _$EntryResponse._(
      {this.id,
      this.date,
      this.body,
      this.voteCount,
      this.commentsCount,
      this.author,
      this.embed})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'date');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'voteCount');
    }
    if (commentsCount == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'commentsCount');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'author');
    }
  }

  @override
  EntryResponse rebuild(void updates(EntryResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryResponseBuilder toBuilder() => new EntryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryResponse &&
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
    return (newBuiltValueToStringHelper('EntryResponse')
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

class EntryResponseBuilder
    implements Builder<EntryResponse, EntryResponseBuilder> {
  _$EntryResponse _$v;

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

  EntryAuthorBuilder _author;
  EntryAuthorBuilder get author => _$this._author ??= new EntryAuthorBuilder();
  set author(EntryAuthorBuilder author) => _$this._author = author;

  EntryEmbedBuilder _embed;
  EntryEmbedBuilder get embed => _$this._embed ??= new EntryEmbedBuilder();
  set embed(EntryEmbedBuilder embed) => _$this._embed = embed;

  EntryResponseBuilder();

  EntryResponseBuilder get _$this {
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
  void replace(EntryResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryResponse;
  }

  @override
  void update(void updates(EntryResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryResponse build() {
    _$EntryResponse _$result;
    try {
      _$result = _$v ??
          new _$EntryResponse._(
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
            'EntryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EntryAuthor extends EntryAuthor {
  @override
  final num color;
  @override
  final String avatar;
  @override
  final String login;

  factory _$EntryAuthor([void updates(EntryAuthorBuilder b)]) =>
      (new EntryAuthorBuilder()..update(updates)).build();

  _$EntryAuthor._({this.color, this.avatar, this.login}) : super._() {
    if (color == null) {
      throw new BuiltValueNullFieldError('EntryAuthor', 'color');
    }
    if (avatar == null) {
      throw new BuiltValueNullFieldError('EntryAuthor', 'avatar');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('EntryAuthor', 'login');
    }
  }

  @override
  EntryAuthor rebuild(void updates(EntryAuthorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryAuthorBuilder toBuilder() => new EntryAuthorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryAuthor &&
        color == other.color &&
        avatar == other.avatar &&
        login == other.login;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, color.hashCode), avatar.hashCode), login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryAuthor')
          ..add('color', color)
          ..add('avatar', avatar)
          ..add('login', login))
        .toString();
  }
}

class EntryAuthorBuilder implements Builder<EntryAuthor, EntryAuthorBuilder> {
  _$EntryAuthor _$v;

  num _color;
  num get color => _$this._color;
  set color(num color) => _$this._color = color;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  EntryAuthorBuilder();

  EntryAuthorBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _avatar = _$v.avatar;
      _login = _$v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryAuthor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryAuthor;
  }

  @override
  void update(void updates(EntryAuthorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryAuthor build() {
    final _$result =
        _$v ?? new _$EntryAuthor._(color: color, avatar: avatar, login: login);
    replace(_$result);
    return _$result;
  }
}

class _$EntryEmbed extends EntryEmbed {
  @override
  final String url;
  @override
  final String preview;

  factory _$EntryEmbed([void updates(EntryEmbedBuilder b)]) =>
      (new EntryEmbedBuilder()..update(updates)).build();

  _$EntryEmbed._({this.url, this.preview}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('EntryEmbed', 'url');
    }
    if (preview == null) {
      throw new BuiltValueNullFieldError('EntryEmbed', 'preview');
    }
  }

  @override
  EntryEmbed rebuild(void updates(EntryEmbedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryEmbedBuilder toBuilder() => new EntryEmbedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryEmbed && url == other.url && preview == other.preview;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, url.hashCode), preview.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryEmbed')
          ..add('url', url)
          ..add('preview', preview))
        .toString();
  }
}

class EntryEmbedBuilder implements Builder<EntryEmbed, EntryEmbedBuilder> {
  _$EntryEmbed _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  EntryEmbedBuilder();

  EntryEmbedBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _preview = _$v.preview;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryEmbed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryEmbed;
  }

  @override
  void update(void updates(EntryEmbedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryEmbed build() {
    final _$result = _$v ?? new _$EntryEmbed._(url: url, preview: preview);
    replace(_$result);
    return _$result;
  }
}
