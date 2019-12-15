import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/notifications_handler.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/themes.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/utils/utils.dart';
<<<<<<< HEAD
import 'dart:async';

import 'package:pref_gen_annotations/pref_gen_annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends PreferenceAdapter {
  SharedPreferences _sharedPrefs;

  Future<SharedPreferences> getSharedPrefs() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
      return _sharedPrefs;
    }
    return _sharedPrefs;
  }

  @override
  Future<bool> getBool(key) async {
    var prefs = await getSharedPrefs();
    try {
      return prefs.getBool(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String> getString(key) async {
    var prefs = await getSharedPrefs();
    try {
      return prefs.getString(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<String>> getStringList(key) async {
    var prefs = await getSharedPrefs();
    try {
      return prefs.getStringList(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<int> getInt(key) async {
    var prefs = await getSharedPrefs();
    try {
      return prefs.getInt(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<double> getDouble(key) async {
    var prefs = await getSharedPrefs();
    try {
      return prefs.getDouble(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setBool(key, value) =>
      getSharedPrefs().then((settings) => settings.setBool(key, value));

  @override
  Future<void> setString(key, value) =>
      getSharedPrefs().then((settings) => settings.setString(key, value));

  @override
  Future<void> setStringList(key, value) =>
      getSharedPrefs().then((settings) => settings.setStringList(key, value));

  @override
  Future<void> setInt(key, value) =>
      getSharedPrefs().then((settings) => settings.setInt(key, value));

  @override
  Future<void> setDouble(key, value) =>
      getSharedPrefs().then((settings) => settings.setDouble(key, value));
}
=======
var owmSettings = OWMSettings(SharedPreferencesAdapter());
>>>>>>> develop

class OwmApp extends StatelessWidget {
  OwmApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HighlightWrapper(
      id: -1,
      child: ErrorHandlerWidget(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: AuthStateModel()),
            Provider.value(value: owmSettings),
            ChangeNotifierProvider.value(value: SuggestionsModel()),
          ],
          child: NotificationsHandler(
            child: Consumer<AuthStateModel>(
              // Required to make app redraw on login
              builder: (context, model, _) => OWMSettingListener(
                rebuildOnChange: (settings) => settings.useDarkThemeStream,
                builder: (context, settings) {
                  return OWMSettingListener(
                    rebuildOnChange: (settings) => settings.accentColorStream,
                    builder: (context, settings) => MaterialApp(
                      title: 'Wykop Mobilny',
                      navigatorKey: OwmKeys.navKey,
                      theme: settings.useDarkTheme
                          ? Themes.darkTheme(accentColor: settings.accentColor)
                          : Themes.lightTheme(accentColor: settings.accentColor),
                      routes: {
                        '/': (context) => MainScreen(),
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


