// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Conversation> _$conversationSerializer =
    new _$ConversationSerializer();

class _$ConversationSerializer implements StructuredSerializer<Conversation> {
  @override
  final Iterable<Type> types = const [Conversation, _$Conversation];
  @override
  final String wireName = 'Conversation';

  @override
  Iterable<Object> serialize(Serializers serializers, Conversation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'lastUpdate',
      serializers.serialize(object.lastUpdate,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(Author)),
    ];

    return result;
  }

  @override
  Conversation deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lastUpdate':
          result.lastUpdate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(Author)) as Author);
          break;
      }
    }

    return result.build();
  }
}

class _$Conversation extends Conversation {
  @override
  final String lastUpdate;
  @override
  final Author author;

  factory _$Conversation([void Function(ConversationBuilder) updates]) =>
      (new ConversationBuilder()..update(updates)).build();

  _$Conversation._({this.lastUpdate, this.author}) : super._() {
    if (lastUpdate == null) {
      throw new BuiltValueNullFieldError('Conversation', 'lastUpdate');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('Conversation', 'author');
    }
  }

  @override
  Conversation rebuild(void Function(ConversationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationBuilder toBuilder() => new ConversationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Conversation &&
        lastUpdate == other.lastUpdate &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, lastUpdate.hashCode), author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Conversation')
          ..add('lastUpdate', lastUpdate)
          ..add('author', author))
        .toString();
  }
}

class ConversationBuilder
    implements Builder<Conversation, ConversationBuilder> {
  _$Conversation _$v;

  String _lastUpdate;
  String get lastUpdate => _$this._lastUpdate;
  set lastUpdate(String lastUpdate) => _$this._lastUpdate = lastUpdate;

  AuthorBuilder _author;
  AuthorBuilder get author => _$this._author ??= new AuthorBuilder();
  set author(AuthorBuilder author) => _$this._author = author;

  ConversationBuilder();

  ConversationBuilder get _$this {
    if (_$v != null) {
      _lastUpdate = _$v.lastUpdate;
      _author = _$v.author?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Conversation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Conversation;
  }

  @override
  void update(void Function(ConversationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Conversation build() {
    _$Conversation _$result;
    try {
      _$result = _$v ??
          new _$Conversation._(lastUpdate: lastUpdate, author: author.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Conversation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
