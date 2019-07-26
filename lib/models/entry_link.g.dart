// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_link.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EntryLink extends EntryLink {
  @override
  final Entry entry;
  @override
  final Link link;

  factory _$EntryLink([void Function(EntryLinkBuilder) updates]) =>
      (new EntryLinkBuilder()..update(updates)).build();

  _$EntryLink._({this.entry, this.link}) : super._();

  @override
  EntryLink rebuild(void Function(EntryLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryLinkBuilder toBuilder() => new EntryLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryLink && entry == other.entry && link == other.link;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, entry.hashCode), link.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryLink')
          ..add('entry', entry)
          ..add('link', link))
        .toString();
  }
}

class EntryLinkBuilder implements Builder<EntryLink, EntryLinkBuilder> {
  _$EntryLink _$v;

  EntryBuilder _entry;
  EntryBuilder get entry => _$this._entry ??= new EntryBuilder();
  set entry(EntryBuilder entry) => _$this._entry = entry;

  LinkBuilder _link;
  LinkBuilder get link => _$this._link ??= new LinkBuilder();
  set link(LinkBuilder link) => _$this._link = link;

  EntryLinkBuilder();

  EntryLinkBuilder get _$this {
    if (_$v != null) {
      _entry = _$v.entry?.toBuilder();
      _link = _$v.link?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryLink other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryLink;
  }

  @override
  void update(void Function(EntryLinkBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryLink build() {
    _$EntryLink _$result;
    try {
      _$result = _$v ??
          new _$EntryLink._(entry: _entry?.build(), link: _link?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'entry';
        _entry?.build();
        _$failedField = 'link';
        _link?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryLink', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
