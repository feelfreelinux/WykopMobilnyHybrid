// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pm_message_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PmMessageResponse> _$pmMessageResponseSerializer =
    new _$PmMessageResponseSerializer();

class _$PmMessageResponseSerializer
    implements StructuredSerializer<PmMessageResponse> {
  @override
  final Iterable<Type> types = const [PmMessageResponse, _$PmMessageResponse];
  @override
  final String wireName = 'PmMessageResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, PmMessageResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'direction',
      serializers.serialize(object.direction,
          specifiedType: const FullType(String)),
    ];
    if (object.body != null) {
      result
        ..add('body')
        ..add(serializers.serialize(object.body,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.app != null) {
      result
        ..add('app')
        ..add(serializers.serialize(object.app,
            specifiedType: const FullType(String)));
    }
    if (object.embed != null) {
      result
        ..add('embed')
        ..add(serializers.serialize(object.embed,
            specifiedType: const FullType(EmbedResponse)));
    }
    if (object.author != null) {
      result
        ..add('author')
        ..add(serializers.serialize(object.author,
            specifiedType: const FullType(AuthorResponse)));
    }
    return result;
  }

  @override
  PmMessageResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PmMessageResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'direction':
          result.direction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'app':
          result.app = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'embed':
          result.embed.replace(serializers.deserialize(value,
              specifiedType: const FullType(EmbedResponse)) as EmbedResponse);
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$PmMessageResponse extends PmMessageResponse {
  @override
  final String date;
  @override
  final String body;
  @override
  final String status;
  @override
  final String direction;
  @override
  final String app;
  @override
  final EmbedResponse embed;
  @override
  final AuthorResponse author;

  factory _$PmMessageResponse(
          [void Function(PmMessageResponseBuilder) updates]) =>
      (new PmMessageResponseBuilder()..update(updates)).build();

  _$PmMessageResponse._(
      {this.date,
      this.body,
      this.status,
      this.direction,
      this.app,
      this.embed,
      this.author})
      : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('PmMessageResponse', 'date');
    }
    if (direction == null) {
      throw new BuiltValueNullFieldError('PmMessageResponse', 'direction');
    }
  }

  @override
  PmMessageResponse rebuild(void Function(PmMessageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PmMessageResponseBuilder toBuilder() =>
      new PmMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PmMessageResponse &&
        date == other.date &&
        body == other.body &&
        status == other.status &&
        direction == other.direction &&
        app == other.app &&
        embed == other.embed &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, date.hashCode), body.hashCode),
                        status.hashCode),
                    direction.hashCode),
                app.hashCode),
            embed.hashCode),
        author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PmMessageResponse')
          ..add('date', date)
          ..add('body', body)
          ..add('status', status)
          ..add('direction', direction)
          ..add('app', app)
          ..add('embed', embed)
          ..add('author', author))
        .toString();
  }
}

class PmMessageResponseBuilder
    implements Builder<PmMessageResponse, PmMessageResponseBuilder> {
  _$PmMessageResponse _$v;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _direction;
  String get direction => _$this._direction;
  set direction(String direction) => _$this._direction = direction;

  String _app;
  String get app => _$this._app;
  set app(String app) => _$this._app = app;

  EmbedResponseBuilder _embed;
  EmbedResponseBuilder get embed =>
      _$this._embed ??= new EmbedResponseBuilder();
  set embed(EmbedResponseBuilder embed) => _$this._embed = embed;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  PmMessageResponseBuilder();

  PmMessageResponseBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _body = _$v.body;
      _status = _$v.status;
      _direction = _$v.direction;
      _app = _$v.app;
      _embed = _$v.embed?.toBuilder();
      _author = _$v.author?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PmMessageResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PmMessageResponse;
  }

  @override
  void update(void Function(PmMessageResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PmMessageResponse build() {
    _$PmMessageResponse _$result;
    try {
      _$result = _$v ??
          new _$PmMessageResponse._(
              date: date,
              body: body,
              status: status,
              direction: direction,
              app: app,
              embed: _embed?.build(),
              author: _author?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'embed';
        _embed?.build();
        _$failedField = 'author';
        _author?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PmMessageResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
