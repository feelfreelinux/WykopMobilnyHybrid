// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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
      'themeState',
      serializers.serialize(object.themeState,
          specifiedType: const FullType(ThemeState)),
      'entitiesState',
      serializers.serialize(object.entitiesState,
          specifiedType: const FullType(EntitiesState)),
      'searchState',
      serializers.serialize(object.searchState,
          specifiedType: const FullType(SearchState)),
      'suggestionsState',
      serializers.serialize(object.suggestionsState,
          specifiedType: const FullType(SuggestionsState)),
      'linksState',
      serializers.serialize(object.linksState,
          specifiedType: const FullType(LinksState)),
      'myWykopState',
      serializers.serialize(object.myWykopState,
          specifiedType: const FullType(MyWykopState)),
      'notificationsState',
      serializers.serialize(object.notificationsState,
          specifiedType: const FullType(NotificationsState)),
      'mikroblogState',
      serializers.serialize(object.mikroblogState,
          specifiedType: const FullType(MikroblogState)),
      'entryScreensState',
      serializers.serialize(object.entryScreensState,
          specifiedType: const FullType(EntryScreensState)),
      'linkScreensState',
      serializers.serialize(object.linkScreensState,
          specifiedType: const FullType(LinkScreensState)),
      'tagsState',
      serializers.serialize(object.tagsState,
          specifiedType: const FullType(TagsState)),
      'profilesState',
      serializers.serialize(object.profilesState,
          specifiedType: const FullType(ProfilesState)),
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
        case 'themeState':
          result.themeState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ThemeState)) as ThemeState);
          break;
        case 'entitiesState':
          result.entitiesState.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntitiesState)) as EntitiesState);
          break;
        case 'searchState':
          result.searchState.replace(serializers.deserialize(value,
              specifiedType: const FullType(SearchState)) as SearchState);
          break;
        case 'suggestionsState':
          result.suggestionsState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SuggestionsState))
              as SuggestionsState);
          break;
        case 'linksState':
          result.linksState.replace(serializers.deserialize(value,
              specifiedType: const FullType(LinksState)) as LinksState);
          break;
        case 'myWykopState':
          result.myWykopState.replace(serializers.deserialize(value,
              specifiedType: const FullType(MyWykopState)) as MyWykopState);
          break;
        case 'notificationsState':
          result.notificationsState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NotificationsState))
              as NotificationsState);
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
        case 'linkScreensState':
          result.linkScreensState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LinkScreensState))
              as LinkScreensState);
          break;
        case 'tagsState':
          result.tagsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(TagsState)) as TagsState);
          break;
        case 'profilesState':
          result.profilesState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProfilesState)) as ProfilesState);
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
  final ThemeState themeState;
  @override
  final EntitiesState entitiesState;
  @override
  final SearchState searchState;
  @override
  final SuggestionsState suggestionsState;
  @override
  final LinksState linksState;
  @override
  final MyWykopState myWykopState;
  @override
  final NotificationsState notificationsState;
  @override
  final MikroblogState mikroblogState;
  @override
  final EntryScreensState entryScreensState;
  @override
  final LinkScreensState linkScreensState;
  @override
  final TagsState tagsState;
  @override
  final ProfilesState profilesState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.authState,
      this.themeState,
      this.entitiesState,
      this.searchState,
      this.suggestionsState,
      this.linksState,
      this.myWykopState,
      this.notificationsState,
      this.mikroblogState,
      this.entryScreensState,
      this.linkScreensState,
      this.tagsState,
      this.profilesState})
      : super._() {
    if (authState == null) {
      throw new BuiltValueNullFieldError('AppState', 'authState');
    }
    if (themeState == null) {
      throw new BuiltValueNullFieldError('AppState', 'themeState');
    }
    if (entitiesState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entitiesState');
    }
    if (searchState == null) {
      throw new BuiltValueNullFieldError('AppState', 'searchState');
    }
    if (suggestionsState == null) {
      throw new BuiltValueNullFieldError('AppState', 'suggestionsState');
    }
    if (linksState == null) {
      throw new BuiltValueNullFieldError('AppState', 'linksState');
    }
    if (myWykopState == null) {
      throw new BuiltValueNullFieldError('AppState', 'myWykopState');
    }
    if (notificationsState == null) {
      throw new BuiltValueNullFieldError('AppState', 'notificationsState');
    }
    if (mikroblogState == null) {
      throw new BuiltValueNullFieldError('AppState', 'mikroblogState');
    }
    if (entryScreensState == null) {
      throw new BuiltValueNullFieldError('AppState', 'entryScreensState');
    }
    if (linkScreensState == null) {
      throw new BuiltValueNullFieldError('AppState', 'linkScreensState');
    }
    if (tagsState == null) {
      throw new BuiltValueNullFieldError('AppState', 'tagsState');
    }
    if (profilesState == null) {
      throw new BuiltValueNullFieldError('AppState', 'profilesState');
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
        themeState == other.themeState &&
        entitiesState == other.entitiesState &&
        searchState == other.searchState &&
        suggestionsState == other.suggestionsState &&
        linksState == other.linksState &&
        myWykopState == other.myWykopState &&
        notificationsState == other.notificationsState &&
        mikroblogState == other.mikroblogState &&
        entryScreensState == other.entryScreensState &&
        linkScreensState == other.linkScreensState &&
        tagsState == other.tagsState &&
        profilesState == other.profilesState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, authState.hashCode),
                                                    themeState.hashCode),
                                                entitiesState.hashCode),
                                            searchState.hashCode),
                                        suggestionsState.hashCode),
                                    linksState.hashCode),
                                myWykopState.hashCode),
                            notificationsState.hashCode),
                        mikroblogState.hashCode),
                    entryScreensState.hashCode),
                linkScreensState.hashCode),
            tagsState.hashCode),
        profilesState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('authState', authState)
          ..add('themeState', themeState)
          ..add('entitiesState', entitiesState)
          ..add('searchState', searchState)
          ..add('suggestionsState', suggestionsState)
          ..add('linksState', linksState)
          ..add('myWykopState', myWykopState)
          ..add('notificationsState', notificationsState)
          ..add('mikroblogState', mikroblogState)
          ..add('entryScreensState', entryScreensState)
          ..add('linkScreensState', linkScreensState)
          ..add('tagsState', tagsState)
          ..add('profilesState', profilesState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  AuthStateBuilder _authState;
  AuthStateBuilder get authState =>
      _$this._authState ??= new AuthStateBuilder();
  set authState(AuthStateBuilder authState) => _$this._authState = authState;

  ThemeStateBuilder _themeState;
  ThemeStateBuilder get themeState =>
      _$this._themeState ??= new ThemeStateBuilder();
  set themeState(ThemeStateBuilder themeState) =>
      _$this._themeState = themeState;

  EntitiesStateBuilder _entitiesState;
  EntitiesStateBuilder get entitiesState =>
      _$this._entitiesState ??= new EntitiesStateBuilder();
  set entitiesState(EntitiesStateBuilder entitiesState) =>
      _$this._entitiesState = entitiesState;

  SearchStateBuilder _searchState;
  SearchStateBuilder get searchState =>
      _$this._searchState ??= new SearchStateBuilder();
  set searchState(SearchStateBuilder searchState) =>
      _$this._searchState = searchState;

  SuggestionsStateBuilder _suggestionsState;
  SuggestionsStateBuilder get suggestionsState =>
      _$this._suggestionsState ??= new SuggestionsStateBuilder();
  set suggestionsState(SuggestionsStateBuilder suggestionsState) =>
      _$this._suggestionsState = suggestionsState;

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

  NotificationsStateBuilder _notificationsState;
  NotificationsStateBuilder get notificationsState =>
      _$this._notificationsState ??= new NotificationsStateBuilder();
  set notificationsState(NotificationsStateBuilder notificationsState) =>
      _$this._notificationsState = notificationsState;

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

  LinkScreensStateBuilder _linkScreensState;
  LinkScreensStateBuilder get linkScreensState =>
      _$this._linkScreensState ??= new LinkScreensStateBuilder();
  set linkScreensState(LinkScreensStateBuilder linkScreensState) =>
      _$this._linkScreensState = linkScreensState;

  TagsStateBuilder _tagsState;
  TagsStateBuilder get tagsState =>
      _$this._tagsState ??= new TagsStateBuilder();
  set tagsState(TagsStateBuilder tagsState) => _$this._tagsState = tagsState;

  ProfilesStateBuilder _profilesState;
  ProfilesStateBuilder get profilesState =>
      _$this._profilesState ??= new ProfilesStateBuilder();
  set profilesState(ProfilesStateBuilder profilesState) =>
      _$this._profilesState = profilesState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _authState = _$v.authState?.toBuilder();
      _themeState = _$v.themeState?.toBuilder();
      _entitiesState = _$v.entitiesState?.toBuilder();
      _searchState = _$v.searchState?.toBuilder();
      _suggestionsState = _$v.suggestionsState?.toBuilder();
      _linksState = _$v.linksState?.toBuilder();
      _myWykopState = _$v.myWykopState?.toBuilder();
      _notificationsState = _$v.notificationsState?.toBuilder();
      _mikroblogState = _$v.mikroblogState?.toBuilder();
      _entryScreensState = _$v.entryScreensState?.toBuilder();
      _linkScreensState = _$v.linkScreensState?.toBuilder();
      _tagsState = _$v.tagsState?.toBuilder();
      _profilesState = _$v.profilesState?.toBuilder();
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
              themeState: themeState.build(),
              entitiesState: entitiesState.build(),
              searchState: searchState.build(),
              suggestionsState: suggestionsState.build(),
              linksState: linksState.build(),
              myWykopState: myWykopState.build(),
              notificationsState: notificationsState.build(),
              mikroblogState: mikroblogState.build(),
              entryScreensState: entryScreensState.build(),
              linkScreensState: linkScreensState.build(),
              tagsState: tagsState.build(),
              profilesState: profilesState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authState';
        authState.build();
        _$failedField = 'themeState';
        themeState.build();
        _$failedField = 'entitiesState';
        entitiesState.build();
        _$failedField = 'searchState';
        searchState.build();
        _$failedField = 'suggestionsState';
        suggestionsState.build();
        _$failedField = 'linksState';
        linksState.build();
        _$failedField = 'myWykopState';
        myWykopState.build();
        _$failedField = 'notificationsState';
        notificationsState.build();
        _$failedField = 'mikroblogState';
        mikroblogState.build();
        _$failedField = 'entryScreensState';
        entryScreensState.build();
        _$failedField = 'linkScreensState';
        linkScreensState.build();
        _$failedField = 'tagsState';
        tagsState.build();
        _$failedField = 'profilesState';
        profilesState.build();
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

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
