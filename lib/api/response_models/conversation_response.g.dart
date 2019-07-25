// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversationResponse> _$conversationResponseSerializer =
    new _$ConversationResponseSerializer();

class _$ConversationResponseSerializer
    implements StructuredSerializer<ConversationResponse> {
  @override
  final Iterable<Type> types = const [
    ConversationResponse,
    _$ConversationResponse
  ];
  @override
  final String wireName = 'ConversationResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConversationResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'last_update',
      serializers.serialize(object.lastUpdate,
          specifiedType: const FullType(String)),
    ];
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.receiver != null) {
      result
        ..add('receiver')
        ..add(serializers.serialize(object.receiver,
            specifiedType: const FullType(AuthorResponse)));
    }
    return result;
  }

  @override
  ConversationResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversationResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'last_update':
          result.lastUpdate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'receiver':
          result.receiver.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$ConversationResponse extends ConversationResponse {
  @override
  final String lastUpdate;
  @override
  final String status;
  @override
  final AuthorResponse receiver;

  factory _$ConversationResponse(
          [void Function(ConversationResponseBuilder) updates]) =>
      (new ConversationResponseBuilder()..update(updates)).build();

  _$ConversationResponse._({this.lastUpdate, this.status, this.receiver})
      : super._() {
    if (lastUpdate == null) {
      throw new BuiltValueNullFieldError('ConversationResponse', 'lastUpdate');
    }
  }

  @override
  ConversationResponse rebuild(
          void Function(ConversationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationResponseBuilder toBuilder() =>
      new ConversationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationResponse &&
        lastUpdate == other.lastUpdate &&
        status == other.status &&
        receiver == other.receiver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, lastUpdate.hashCode), status.hashCode), receiver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversationResponse')
          ..add('lastUpdate', lastUpdate)
          ..add('status', status)
          ..add('receiver', receiver))
        .toString();
  }
}

class ConversationResponseBuilder
    implements Builder<ConversationResponse, ConversationResponseBuilder> {
  _$ConversationResponse _$v;

  String _lastUpdate;
  String get lastUpdate => _$this._lastUpdate;
  set lastUpdate(String lastUpdate) => _$this._lastUpdate = lastUpdate;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  AuthorResponseBuilder _receiver;
  AuthorResponseBuilder get receiver =>
      _$this._receiver ??= new AuthorResponseBuilder();
  set receiver(AuthorResponseBuilder receiver) => _$this._receiver = receiver;

  ConversationResponseBuilder();

  ConversationResponseBuilder get _$this {
    if (_$v != null) {
      _lastUpdate = _$v.lastUpdate;
      _status = _$v.status;
      _receiver = _$v.receiver?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConversationResponse;
  }

  @override
  void update(void Function(ConversationResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConversationResponse build() {
    _$ConversationResponse _$result;
    try {
      _$result = _$v ??
          new _$ConversationResponse._(
              lastUpdate: lastUpdate,
              status: status,
              receiver: _receiver?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'receiver';
        _receiver?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ConversationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
