// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_link_response.dart';

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

class _$EntryLinkResponse extends EntryLinkResponse {
  @override
  final LinkResponse link;
  @override
  final EntryResponse entry;

  factory _$EntryLinkResponse([void updates(EntryLinkResponseBuilder b)]) =>
      (new EntryLinkResponseBuilder()..update(updates)).build();

  _$EntryLinkResponse._({this.link, this.entry}) : super._();

  @override
  EntryLinkResponse rebuild(void updates(EntryLinkResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryLinkResponseBuilder toBuilder() =>
      new EntryLinkResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryLinkResponse &&
        link == other.link &&
        entry == other.entry;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, link.hashCode), entry.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryLinkResponse')
          ..add('link', link)
          ..add('entry', entry))
        .toString();
  }
}

class EntryLinkResponseBuilder
    implements Builder<EntryLinkResponse, EntryLinkResponseBuilder> {
  _$EntryLinkResponse _$v;

  LinkResponseBuilder _link;
  LinkResponseBuilder get link => _$this._link ??= new LinkResponseBuilder();
  set link(LinkResponseBuilder link) => _$this._link = link;

  EntryResponseBuilder _entry;
  EntryResponseBuilder get entry =>
      _$this._entry ??= new EntryResponseBuilder();
  set entry(EntryResponseBuilder entry) => _$this._entry = entry;

  EntryLinkResponseBuilder();

  EntryLinkResponseBuilder get _$this {
    if (_$v != null) {
      _link = _$v.link?.toBuilder();
      _entry = _$v.entry?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryLinkResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryLinkResponse;
  }

  @override
  void update(void updates(EntryLinkResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryLinkResponse build() {
    _$EntryLinkResponse _$result;
    try {
      _$result = _$v ??
          new _$EntryLinkResponse._(
              link: _link?.build(), entry: _entry?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'link';
        _link?.build();
        _$failedField = 'entry';
        _entry?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryLinkResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
