// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pm_message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PmMessage> _$pmMessageSerializer = new _$PmMessageSerializer();

class _$PmMessageSerializer implements StructuredSerializer<PmMessage> {
  @override
  final Iterable<Type> types = const [PmMessage, _$PmMessage];
  @override
  final String wireName = 'PmMessage';

  @override
  Iterable serialize(Serializers serializers, PmMessage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'embed',
      serializers.serialize(object.embed, specifiedType: const FullType(Embed)),
      'isSentFromUser',
      serializers.serialize(object.isSentFromUser,
          specifiedType: const FullType(bool)),
    ];
    if (object.app != null) {
      result
        ..add('app')
        ..add(serializers.serialize(object.app,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  PmMessage deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PmMessageBuilder();

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
        case 'embed':
          result.embed.replace(serializers.deserialize(value,
              specifiedType: const FullType(Embed)) as Embed);
          break;
        case 'isSentFromUser':
          result.isSentFromUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$PmMessage extends PmMessage {
  @override
  final String date;
  @override
  final String body;
  @override
  final Embed embed;
  @override
  final bool isSentFromUser;
  @override
  final String app;

  factory _$PmMessage([void updates(PmMessageBuilder b)]) =>
      (new PmMessageBuilder()..update(updates)).build();

  _$PmMessage._(
      {this.date, this.body, this.embed, this.isSentFromUser, this.app})
      : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('PmMessage', 'date');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('PmMessage', 'body');
    }
    if (embed == null) {
      throw new BuiltValueNullFieldError('PmMessage', 'embed');
    }
    if (isSentFromUser == null) {
      throw new BuiltValueNullFieldError('PmMessage', 'isSentFromUser');
    }
  }

  @override
  PmMessage rebuild(void updates(PmMessageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PmMessageBuilder toBuilder() => new PmMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PmMessage &&
        date == other.date &&
        body == other.body &&
        embed == other.embed &&
        isSentFromUser == other.isSentFromUser &&
        app == other.app;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, date.hashCode), body.hashCode), embed.hashCode),
            isSentFromUser.hashCode),
        app.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PmMessage')
          ..add('date', date)
          ..add('body', body)
          ..add('embed', embed)
          ..add('isSentFromUser', isSentFromUser)
          ..add('app', app))
        .toString();
  }
}

class PmMessageBuilder implements Builder<PmMessage, PmMessageBuilder> {
  _$PmMessage _$v;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  EmbedBuilder _embed;
  EmbedBuilder get embed => _$this._embed ??= new EmbedBuilder();
  set embed(EmbedBuilder embed) => _$this._embed = embed;

  bool _isSentFromUser;
  bool get isSentFromUser => _$this._isSentFromUser;
  set isSentFromUser(bool isSentFromUser) =>
      _$this._isSentFromUser = isSentFromUser;

  String _app;
  String get app => _$this._app;
  set app(String app) => _$this._app = app;

  PmMessageBuilder();

  PmMessageBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _body = _$v.body;
      _embed = _$v.embed?.toBuilder();
      _isSentFromUser = _$v.isSentFromUser;
      _app = _$v.app;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PmMessage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PmMessage;
  }

  @override
  void update(void updates(PmMessageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PmMessage build() {
    _$PmMessage _$result;
    try {
      _$result = _$v ??
          new _$PmMessage._(
              date: date,
              body: body,
              embed: embed.build(),
              isSentFromUser: isSentFromUser,
              app: app);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'embed';
        embed.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PmMessage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
