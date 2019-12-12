import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/themes.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/utils/utils.dart';
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
            Provider.value(value: OWMSettings(SharedPreferencesAdapter())),
            ChangeNotifierProvider.value(value: SuggestionsModel()),
          ],
          child: Consumer<AuthStateModel>(
            // Required to make app redraw on login
            builder: (context, model, _) => OWMSettingListener(
              rebuildOnChange: (settings) => settings.useDarkThemeStream,
              builder: (context, settings) {
                return OWMSettingListener(
                  rebuildOnChange: (settings) => settings.accentColorStream,
                  builder: (context, settings) => MaterialApp(
                    /*  Super genialny kod mówiącu czy włączyć nocny
                              W sumie wystarczy też mieć godziny wschodu i zachodu i też się nada
                              TODO: Jakoś sprawdzać czy to już i zmieniać w locie motyw apki

                          var a = DateTime.now();
                          var b = DateTime(
                              a.year,
                              a.month,
                              a.day,
                              int.parse(
                                  settings.autoDarkThemeTimeFrom.split(":")[0]),
                              int.parse(
                                  settings.autoDarkThemeTimeFrom.split(":")[1]));
                          var c = DateTime(
                              a.year,
                              a.month,
                              a.day,
                              int.parse(settings.autoDarkThemeTimeTo.split(":")[0]),
                              int.parse(
                                  settings.autoDarkThemeTimeTo.split(":")[1]));
                          bool k = (a.difference(b).inMinutes >= 0) && (a.difference(c).inMinutes <= 0);
                          */
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
    );
  }
}
