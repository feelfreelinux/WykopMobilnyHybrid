import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/main.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class MainSettingsScreen extends StatelessWidget {
  static const platform =
      const MethodChannel('feelfreelinux.github.io/owmhybrid');

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppbarNormalWidget(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          leading: AppBarButton(
            icon: Icons.close,
            onTap: () => Navigator.of(context).pop(),
            round: true,
            iconSize: 26.0,
            iconPadding: EdgeInsets.all(5.0),
          ),
          title: "Ustawienia",
          actions: <Widget>[
            _drawThemeButton(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _drawHeader(),
              _drawButtonsList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawHeader() {
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) {
        return Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 40.0,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                      ),
                    ],
                  ),
                  child: authStateModel.loggedIn &&
                          authStateModel.backgroundUrl != null
                      ? Image(
                          height: 140.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          image: AdvancedNetworkImage(
                            authStateModel.backgroundUrl,
                            useDiskCache: true,
                          ),
                        )
                      : Container(
                          height: 140.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff2e6e99),
                                Color(0xff4383af),
                              ],
                            ),
                          ),
                        ),
                ),
                AvatarWidget(
                  author: Author.fromAuthState(
                      avatarUrl: authStateModel.avatarUrl ?? "",
                      username: authStateModel.login ?? "",
                      color: authStateModel.color ?? 0),
                  size: 100.0,
                  badge: Colors.transparent,
                  genderVisibility: false,
                ),
              ],
            ),
            GestureDetector(
              onTap: authStateModel.loggedIn
                  ? () {}
                  : () async {
                      var result = await platform.invokeMethod(
                          'openLoginScreen',
                          Map.from({'appKey': api.getAppKey()}));
                      print(result);
                      await authStateModel.loginUser(
                          result['login'], result['token']);
                      RestartWidget.restartApp(context);
                    },
              child: Container(
                padding: EdgeInsets.only(
                  left: 18.0,
                  top: 12.0,
                  right: 18.0,
                  bottom: 14.0,
                ),
                child: Text(
                  authStateModel.login ?? "Zaloguj się",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            authStateModel.loggedIn
                ? GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 14.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Utils.backgroundGreyOpacity(context),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Edytuj profil",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  Widget _drawButtonsList(BuildContext context) {
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            authStateModel.loggedIn
                ? _drawButton(
                    context,
                    icon: Icons.account_circle,
                    color: Utils.getAuthorColor(
                        Author.fromAuthState(
                            avatarUrl: authStateModel.avatarUrl,
                            username: authStateModel.login,
                            color: authStateModel.color),
                        context),
                    title: "Twój profil",
                    onTap: () {},
                  )
                : Container(),
            _drawButton(
              context,
              icon: Icons.history,
              color: Colors.purple,
              title: "Historia wyszukiwania",
              onTap: () {},
            ),
            authStateModel.loggedIn
                ? _drawButton(
                    context,
                    icon: Icons.block,
                    color: Colors.red,
                    title: "Czarna lista",
                    description: "Lista blokowanych tagów i użytkowników.",
                    onTap: () {},
                  )
                : Container(),
            _drawButton(
              context,
              icon: Icons.exit_to_app,
              color: Colors.grey[850],
              title: authStateModel.loggedIn ? "Wyloguj się" : "Zaloguj się",
              onTap: () async {
                if (authStateModel.loggedIn) {
                  authStateModel.logoutUser();
                } else {
                  var result = await platform.invokeMethod(
                      'openLoginScreen', Map.from({'appKey': api.getAppKey()}));
                  await authStateModel.loginUser(
                      result['login'], result['token']);
                  RestartWidget.restartApp(context);
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Divider(),
            ),
            _drawButton(
              context,
              icon: Icons.palette,
              color: Colors.cyan,
              title: "Wygląd",
              description: "Tryb nocny, czy dzienny? Zmień wygląd aplikacji.",
              onTap: () {},
            ),
            _drawButton(context,
                title: "Obrazki i multimedia",
                icon: Icons.image,
                onTap: () {},
                color: Colors.indigo,
                description:
                    "Rozmiar, zwijanie obrazków, odtwarzacz multimediów."),
            _drawButton(context,
                title: "Tekst",
                icon: Icons.chat,
                onTap: () {},
                color: Colors.amber,
                description:
                    "Wyświetlanie spoilerów, zwijanie długich treści."),
            _drawButton(context,
                title: "Powiadomienia",
                icon: Icons.notifications,
                onTap: () {},
                color: Colors.blueAccent,
                description:
                    "Włącz, przechwyć lub ustaw czas sprawdzania powiadomień."),
            _drawButton(context,
                title: "Zachowanie",
                icon: Icons.settings,
                onTap: () {},
                color: Colors.grey,
                description: "Filtrowanie i ukrywanie teści, domyślne ekrany."),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Divider(),
            ),
            _drawButton(context,
                title: "Zgłoś błąd",
                icon: Icons.bug_report,
                onTap: () {},
                color: Colors.red,
                description: "Jeżeli widzisz błąd możesz go tutaj zgłosić."),
            _drawButton(context,
                title: "Wsparcie",
                icon: Icons.monetization_on,
                onTap: () {},
                color: Colors.green,
                description: "Podoba Ci się aplikacja? Wesprzyj jej twórców."),
            _drawButton(context,
                title: "O aplikacji", icon: Icons.info, onTap: () {}),
            Padding(
              padding: EdgeInsets.only(
                bottom: 8.0,
              ),
            )
          ],
        );
      },
    );
  }

  Widget _drawButton(
    BuildContext context, {
    IconData icon,
    String title,
    String description = "",
    Color color,
    VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 18.0,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 16.0,
              ),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: color ?? Theme.of(context).accentColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                //color: Theme.of(context).backgroundColor,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  description.length > 0
                      ? Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Theme.of(context).textTheme.caption.color,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawThemeButton() {
    return OWMSettingListener(
      rebuildOnChange: (settings) => settings.useDarkThemeStream,
      builder: (context, settings) => AppBarButton(
        icon: settings.useDarkTheme ? Icons.wb_sunny : Icons.brightness_2,
        onTap: () => settings.useDarkTheme = !settings.useDarkTheme,
        round: true,
        iconSize: 22.0,
        iconPadding: EdgeInsets.all(7.0),
      ),
    );
  }
}
