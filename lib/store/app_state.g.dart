// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

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

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'authState',
      serializers.serialize(object.authState,
          specifiedType: const FullType(AuthState)),
      'entitiesState',
      serializers.serialize(object.entitiesState,
          specifiedType: const FullType(EntitiesState)),
      'linksState',
      serializers.serialize(object.linksState,
          specifiedType: const FullType(LinksState)),
      'myWykopState',
      serializers.serialize(object.myWykopState,
          specifiedType: const FullType(MyWykopState)),
      'mikroblogState',
      serializers.serialize(object.mikroblogState,
          specifiedType: const FullType(MikroblogState)),
      'entryScreensState',
      serializers.serialize(object.entryScreensState,
          specifiedType: const FullType(EntryScreensState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'authState':
          result.authState.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthState)) as AuthState);
          break;
        case 'entitiesState':
          result.entitiesState.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntitiesState)) as EntitiesState);
          break;
        case 'linksState':
          result.linksState.replace(serializers.deserialize(value,
              specifiedType: const FullType(LinksState)) as LinksState);
          break;
        case 'myWykopState':
          result.myWykopState.replace(serializers.deserialize(value,
              specifiedType: const FullType(MyWykopState)) as MyWykopState);
          break;
        case 'mikroblogState':
          result.mikroblogState.replace(serializers.deserialize(value,
              specifiedType: const FullType(MikroblogState)) as MikroblogState);
          break;
        case 'entryScreensState':
          result.entryScreensState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(EntryScreensState))
              as EntryScreensState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final AuthState authState;
  @override
  final EntitiesState entitiesState;
  @override
  final LinksState linksState;
  @override
  final MyWykopState myWykopState;
  @override
  final MikroblogState mikroblogState;
  @override
  final EntryScreensState entryScreensState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.authState,
      this.entitiesState,
      this.linksState,
      this.myWykopState,
      this.mikroblogState,
      this.entryScreensState})
      : super._() {
    if (authState == null) {
      throw new BuiltValueNullFieldError('AppState', 'authState');
    }
    if (entitiesState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entitiesState');
    }
    if (linksState == null) {
      throw new BuiltValueNullFieldError('AppState', 'linksState');
    }
    if (myWykopState == null) {
      throw new BuiltValueNullFieldError('AppState', 'myWykopState');
    }
    if (mikroblogState == null) {
      throw new BuiltValueNullFieldError('AppState', 'mikroblogState');
    }
    if (entryScreensState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entryScreensState');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        authState == other.authState &&
        entitiesState == other.entitiesState &&
        linksState == other.linksState &&
        myWykopState == other.myWykopState &&
        mikroblogState == other.mikroblogState &&
        entryScreensState == other.entryScreensState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, authState.hashCode), entitiesState.hashCode),
                    linksState.hashCode),
                myWykopState.hashCode),
            mikroblogState.hashCode),
        entryScreensState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('authState', authState)
          ..add('entitiesState', entitiesState)
          ..add('linksState', linksState)
          ..add('myWykopState', myWykopState)
          ..add('mikroblogState', mikroblogState)
          ..add('entryScreensState', entryScreensState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  AuthStateBuilder _authState;
  AuthStateBuilder get authState =>
      _$this._authState ??= new AuthStateBuilder();
  set authState(AuthStateBuilder authState) => _$this._authState = authState;

  EntitiesStateBuilder _entitiesState;
  EntitiesStateBuilder get entitiesState =>
      _$this._entitiesState ??= new EntitiesStateBuilder();
  set entitiesState(EntitiesStateBuilder entitiesState) =>
      _$this._entitiesState = entitiesState;

  LinksStateBuilder _linksState;
  LinksStateBuilder get linksState =>
      _$this._linksState ??= new LinksStateBuilder();
  set linksState(LinksStateBuilder linksState) =>
      _$this._linksState = linksState;

  MyWykopStateBuilder _myWykopState;
  MyWykopStateBuilder get myWykopState =>
      _$this._myWykopState ??= new MyWykopStateBuilder();
  set myWykopState(MyWykopStateBuilder myWykopState) =>
      _$this._myWykopState = myWykopState;

  MikroblogStateBuilder _mikroblogState;
  MikroblogStateBuilder get mikroblogState =>
      _$this._mikroblogState ??= new MikroblogStateBuilder();
  set mikroblogState(MikroblogStateBuilder mikroblogState) =>
      _$this._mikroblogState = mikroblogState;

  EntryScreensStateBuilder _entryScreensState;
  EntryScreensStateBuilder get entryScreensState =>
      _$this._entryScreensState ??= new EntryScreensStateBuilder();
  set entryScreensState(EntryScreensStateBuilder entryScreensState) =>
      _$this._entryScreensState = entryScreensState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _authState = _$v.authState?.toBuilder();
      _entitiesState = _$v.entitiesState?.toBuilder();
      _linksState = _$v.linksState?.toBuilder();
      _myWykopState = _$v.myWykopState?.toBuilder();
      _mikroblogState = _$v.mikroblogState?.toBuilder();
      _entryScreensState = _$v.entryScreensState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              authState: authState.build(),
              entitiesState: entitiesState.build(),
              linksState: linksState.build(),
              myWykopState: myWykopState.build(),
              mikroblogState: mikroblogState.build(),
              entryScreensState: entryScreensState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authState';
        authState.build();
        _$failedField = 'entitiesState';
        entitiesState.build();
        _$failedField = 'linksState';
        linksState.build();
        _$failedField = 'myWykopState';
        myWykopState.build();
        _$failedField = 'mikroblogState';
        mikroblogState.build();
        _$failedField = 'entryScreensState';
        entryScreensState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
