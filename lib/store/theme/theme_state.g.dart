// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ThemeState> _$themeStateSerializer = new _$ThemeStateSerializer();

class _$ThemeStateSerializer implements StructuredSerializer<ThemeState> {
  @override
  final Iterable<Type> types = const [ThemeState, _$ThemeState];
  @override
  final String wireName = 'ThemeState';

  @override
  Iterable serialize(Serializers serializers, ThemeState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currentTheme',
      serializers.serialize(object.currentTheme,
          specifiedType: const FullType(OWMTheme)),
    ];

    return result;
  }

  @override
  ThemeState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThemeStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentTheme':
          result.currentTheme = serializers.deserialize(value,
              specifiedType: const FullType(OWMTheme)) as OWMTheme;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemeState extends ThemeState {
  @override
  final OWMTheme currentTheme;

  factory _$ThemeState([void updates(ThemeStateBuilder b)]) =>
      (new ThemeStateBuilder()..update(updates)).build();

  _$ThemeState._({this.currentTheme}) : super._() {
    if (currentTheme == null) {
      throw new BuiltValueNullFieldError('ThemeState', 'currentTheme');
    }
  }

  @override
  ThemeState rebuild(void updates(ThemeStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeStateBuilder toBuilder() => new ThemeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeState && currentTheme == other.currentTheme;
  }

  @override
  int get hashCode {
    return $jf($jc(0, currentTheme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ThemeState')
          ..add('currentTheme', currentTheme))
        .toString();
  }
}

class ThemeStateBuilder implements Builder<ThemeState, ThemeStateBuilder> {
  _$ThemeState _$v;

  OWMTheme _currentTheme;
  OWMTheme get currentTheme => _$this._currentTheme;
  set currentTheme(OWMTheme currentTheme) =>
      _$this._currentTheme = currentTheme;

  ThemeStateBuilder();

  ThemeStateBuilder get _$this {
    if (_$v != null) {
      _currentTheme = _$v.currentTheme;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemeState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ThemeState;
  }

  @override
  void update(void updates(ThemeStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ThemeState build() {
    final _$result = _$v ?? new _$ThemeState._(currentTheme: currentTheme);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
