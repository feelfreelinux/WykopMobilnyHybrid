// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationResponse> _$notificationResponseSerializer =
    new _$NotificationResponseSerializer();

class _$NotificationResponseSerializer
    implements StructuredSerializer<NotificationResponse> {
  @override
  final Iterable<Type> types = const [
    NotificationResponse,
    _$NotificationResponse
  ];
  @override
  final String wireName = 'NotificationResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NotificationResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    if (object.body != null) {
      result
        ..add('body')
        ..add(serializers.serialize(object.body,
            specifiedType: const FullType(String)));
    }
    if (object.itemId != null) {
      result
        ..add('item_id')
        ..add(serializers.serialize(object.itemId,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.isNew != null) {
      result
        ..add('new')
        ..add(serializers.serialize(object.isNew,
            specifiedType: const FullType(bool)));
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
  NotificationResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationResponseBuilder();

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
        case 'item_id':
          result.itemId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'new':
          result.isNew = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$NotificationResponse extends NotificationResponse {
  @override
  final int id;
  @override
  final String date;
  @override
  final String body;
  @override
  final String itemId;
  @override
  final String url;
  @override
  final String type;
  @override
  final bool isNew;
  @override
  final AuthorResponse author;

  factory _$NotificationResponse(
          [void Function(NotificationResponseBuilder) updates]) =>
      (new NotificationResponseBuilder()..update(updates)).build();

  _$NotificationResponse._(
      {this.id,
      this.date,
      this.body,
      this.itemId,
      this.url,
      this.type,
      this.isNew,
      this.author})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('NotificationResponse', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('NotificationResponse', 'date');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('NotificationResponse', 'type');
    }
  }

  @override
  NotificationResponse rebuild(
          void Function(NotificationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationResponseBuilder toBuilder() =>
      new NotificationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationResponse &&
        id == other.id &&
        date == other.date &&
        body == other.body &&
        itemId == other.itemId &&
        url == other.url &&
        type == other.type &&
        isNew == other.isNew &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), date.hashCode),
                            body.hashCode),
                        itemId.hashCode),
                    url.hashCode),
                type.hashCode),
            isNew.hashCode),
        author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotificationResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('body', body)
          ..add('itemId', itemId)
          ..add('url', url)
          ..add('type', type)
          ..add('isNew', isNew)
          ..add('author', author))
        .toString();
  }
}

class NotificationResponseBuilder
    implements Builder<NotificationResponse, NotificationResponseBuilder> {
  _$NotificationResponse _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  String _itemId;
  String get itemId => _$this._itemId;
  set itemId(String itemId) => _$this._itemId = itemId;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  bool _isNew;
  bool get isNew => _$this._isNew;
  set isNew(bool isNew) => _$this._isNew = isNew;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  NotificationResponseBuilder();

  NotificationResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _body = _$v.body;
      _itemId = _$v.itemId;
      _url = _$v.url;
      _type = _$v.type;
      _isNew = _$v.isNew;
      _author = _$v.author?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NotificationResponse;
  }

  @override
  void update(void Function(NotificationResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NotificationResponse build() {
    _$NotificationResponse _$result;
    try {
      _$result = _$v ??
          new _$NotificationResponse._(
              id: id,
              date: date,
              body: body,
              itemId: itemId,
              url: url,
              type: type,
              isNew: isNew,
              author: _author?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        _author?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NotificationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
