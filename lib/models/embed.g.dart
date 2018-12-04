// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed.dart';

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

class _$Embed extends Embed {
  @override
  final String preview;
  @override
  final String url;

  factory _$Embed([void updates(EmbedBuilder b)]) =>
      (new EmbedBuilder()..update(updates)).build();

  _$Embed._({this.preview, this.url}) : super._() {
    if (preview == null) {
      throw new BuiltValueNullFieldError('Embed', 'preview');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Embed', 'url');
    }
  }

  @override
  Embed rebuild(void updates(EmbedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EmbedBuilder toBuilder() => new EmbedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Embed && preview == other.preview && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, preview.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Embed')
          ..add('preview', preview)
          ..add('url', url))
        .toString();
  }
}

class EmbedBuilder implements Builder<Embed, EmbedBuilder> {
  _$Embed _$v;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  EmbedBuilder();

  EmbedBuilder get _$this {
    if (_$v != null) {
      _preview = _$v.preview;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Embed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Embed;
  }

  @override
  void update(void updates(EmbedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Embed build() {
    final _$result = _$v ?? new _$Embed._(preview: preview, url: url);
    replace(_$result);
    return _$result;
  }
}
