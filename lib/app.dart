import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/themes.dart';
import 'package:owmflutter/keys.dart';

class OwmApp extends StatelessWidget {
  OwmApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthStateModel>(
      builder: (_) => AuthStateModel(),
      child: ChangeNotifierProvider<SuggestionsModel>(
        builder: (_) => SuggestionsModel(),
        child: Consumer<AuthStateModel>(
          // Required to make app redraw on login
          builder: (context, model, _) => MaterialApp(
            title: 'Wykop Mobilny',
            navigatorKey: OwmKeys.navKey,
            theme: Themes.lightTheme(),
            routes: {
              '/': (context) => MainScreen(),
            },
          ),
        ),
      ),
    );
  }
}
