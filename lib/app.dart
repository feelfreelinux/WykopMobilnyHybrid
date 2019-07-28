import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:pref_gen_flutter/pref_gen_flutter.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/themes.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/utils/utils.dart';

class OwmApp extends StatelessWidget {
  OwmApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorHandlerWidget(
      child: ChangeNotifierProvider<AuthStateModel>(
        builder: (_) => AuthStateModel(),
        child: Provider<OWMSettings>(
          builder: (_) => OWMSettings(SharedPreferencesAdapter()),
          child: ChangeNotifierProvider<SuggestionsModel>(
            builder: (_) => SuggestionsModel(),
            child: Consumer<AuthStateModel>(
              // Required to make app redraw on login
              builder: (context, model, _) => OWMSettingListener(
                rebuildOnChange: (settings) => settings.useDarkThemeStream,
                builder: (context, settings) => MaterialApp(
                  title: 'Wykop Mobilny',
                  navigatorKey: OwmKeys.navKey,
                  theme: settings.useDarkTheme
                      ? Themes.darkTheme()
                      : Themes.lightTheme(),
                  routes: {
                    '/': (context) => MainScreen(),
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
