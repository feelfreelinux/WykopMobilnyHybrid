// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voter_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VoterResponse> _$voterResponseSerializer =
    new _$VoterResponseSerializer();

class _$VoterResponseSerializer implements StructuredSerializer<VoterResponse> {
  @override
  final Iterable<Type> types = const [VoterResponse, _$VoterResponse];
  @override
  final String wireName = 'VoterResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, VoterResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(AuthorResponse)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'vote_type',
      serializers.serialize(object.voteType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VoterResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VoterResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_type':
          result.voteType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VoterResponse extends VoterResponse {
  @override
  final AuthorResponse author;
  @override
  final String date;
  @override
  final String voteType;

  factory _$VoterResponse([void Function(VoterResponseBuilder) updates]) =>
      (new VoterResponseBuilder()..update(updates)).build();

  _$VoterResponse._({this.author, this.date, this.voteType}) : super._() {
    if (author == null) {
      throw new BuiltValueNullFieldError('VoterResponse', 'author');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('VoterResponse', 'date');
    }
    if (voteType == null) {
      throw new BuiltValueNullFieldError('VoterResponse', 'voteType');
    }
  }

  @override
  VoterResponse rebuild(void Function(VoterResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoterResponseBuilder toBuilder() => new VoterResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoterResponse &&
        author == other.author &&
        date == other.date &&
        voteType == other.voteType;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, author.hashCode), date.hashCode), voteType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VoterResponse')
          ..add('author', author)
          ..add('date', date)
          ..add('voteType', voteType))
        .toString();
  }
}

class VoterResponseBuilder
    implements Builder<VoterResponse, VoterResponseBuilder> {
  _$VoterResponse _$v;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _voteType;
  String get voteType => _$this._voteType;
  set voteType(String voteType) => _$this._voteType = voteType;

  VoterResponseBuilder();

  VoterResponseBuilder get _$this {
    if (_$v != null) {
      _author = _$v.author?.toBuilder();
      _date = _$v.date;
      _voteType = _$v.voteType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoterResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VoterResponse;
  }

  @override
  void update(void Function(VoterResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VoterResponse build() {
    _$VoterResponse _$result;
    try {
      _$result = _$v ??
          new _$VoterResponse._(
              author: author.build(), date: date, voteType: voteType);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VoterResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
