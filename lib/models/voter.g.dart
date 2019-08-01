// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Voter extends Voter {
  @override
  final Author author;
  @override
  final String date;
  @override
  final int voteType;

  factory _$Voter([void Function(VoterBuilder) updates]) =>
      (new VoterBuilder()..update(updates)).build();

  _$Voter._({this.author, this.date, this.voteType}) : super._() {
    if (author == null) {
      throw new BuiltValueNullFieldError('Voter', 'author');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('Voter', 'date');
    }
    if (voteType == null) {
      throw new BuiltValueNullFieldError('Voter', 'voteType');
    }
  }

  @override
  Voter rebuild(void Function(VoterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoterBuilder toBuilder() => new VoterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Voter &&
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
    return (newBuiltValueToStringHelper('Voter')
          ..add('author', author)
          ..add('date', date)
          ..add('voteType', voteType))
        .toString();
  }
}

class VoterBuilder implements Builder<Voter, VoterBuilder> {
  _$Voter _$v;

  AuthorBuilder _author;
  AuthorBuilder get author => _$this._author ??= new AuthorBuilder();
  set author(AuthorBuilder author) => _$this._author = author;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  int _voteType;
  int get voteType => _$this._voteType;
  set voteType(int voteType) => _$this._voteType = voteType;

  VoterBuilder();

  VoterBuilder get _$this {
    if (_$v != null) {
      _author = _$v.author?.toBuilder();
      _date = _$v.date;
      _voteType = _$v.voteType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Voter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Voter;
  }

  @override
  void update(void Function(VoterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Voter build() {
    _$Voter _$result;
    try {
      _$result = _$v ??
          new _$Voter._(author: author.build(), date: date, voteType: voteType);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Voter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
