// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_related.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileRelated extends ProfileRelated {
  @override
  final int id;
  @override
  final String url;
  @override
  final String title;
  @override
  final int voteCount;

  factory _$ProfileRelated([void Function(ProfileRelatedBuilder) updates]) =>
      (new ProfileRelatedBuilder()..update(updates)).build();

  _$ProfileRelated._({this.id, this.url, this.title, this.voteCount})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ProfileRelated', 'id');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('ProfileRelated', 'url');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('ProfileRelated', 'title');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('ProfileRelated', 'voteCount');
    }
  }

  @override
  ProfileRelated rebuild(void Function(ProfileRelatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileRelatedBuilder toBuilder() =>
      new ProfileRelatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileRelated &&
        id == other.id &&
        url == other.url &&
        title == other.title &&
        voteCount == other.voteCount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), url.hashCode), title.hashCode),
        voteCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileRelated')
          ..add('id', id)
          ..add('url', url)
          ..add('title', title)
          ..add('voteCount', voteCount))
        .toString();
  }
}

class ProfileRelatedBuilder
    implements Builder<ProfileRelated, ProfileRelatedBuilder> {
  _$ProfileRelated _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  ProfileRelatedBuilder();

  ProfileRelatedBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _url = _$v.url;
      _title = _$v.title;
      _voteCount = _$v.voteCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileRelated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileRelated;
  }

  @override
  void update(void Function(ProfileRelatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileRelated build() {
    final _$result = _$v ??
        new _$ProfileRelated._(
            id: id, url: url, title: title, voteCount: voteCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
