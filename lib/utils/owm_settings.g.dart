// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owm_settings.dart';

// **************************************************************************
// ReactiveSharedPreferencesGenerator
// **************************************************************************

class _$OWMSettings implements OWMSettings {
  _$OWMSettings(PreferenceAdapter adapter) : this._adapter = adapter {
    useDarkThemeSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useDarkTheme", value);
            _useDarkThemeSubject.add(value);
          }))
        .sink;
    _adapter.getBool("useDarkTheme").then((value) {
      return value ?? false;
    }).then(useDarkThemeSink.add);
  }

  final PreferenceAdapter _adapter;

  final BehaviorSubject<bool> _useDarkThemeSubject =
      BehaviorSubject<bool>(seedValue: false);

  Sink<bool> useDarkThemeSink;

  Stream<bool> get useDarkThemeStream =>
      _useDarkThemeSubject.asBroadcastStream();
  bool get useDarkTheme => _useDarkThemeSubject.value;
  set useDarkTheme(bool value) => useDarkThemeSink.add(value);
  void dispose() {
    useDarkThemeSink.close();
  }
}

abstract class OWMSettingsPreferences {
  Sink<bool> useDarkThemeSink;

  Stream<bool> get useDarkThemeStream;
  void dispose() {
    useDarkThemeSink.close();
  }
}
