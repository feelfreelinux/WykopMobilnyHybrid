import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class MainSettingsScreen extends StatelessWidget {
  static const platform =
      const MethodChannel('feelfreelinux.github.io/owmhybrid');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 1.5,
            pinned: true,
            leading: _drawBackButton(context),
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _drawHeader(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _drawButtonsList(context),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _drawLogoutButton(),
              _drawThemeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawBackButton(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Icon(
          Icons.close,
        ),
      ),
      onPressed: () {
        Navigator.of(context).maybePop();
      },
    );
  }

  Widget _drawHeader() {
    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.authState,
      builder: (context, authState) {
        return Stack(
          children: [
            authState.loggedIn
                ? Image(
                    height: 140.0,
                    fit: BoxFit.cover,
                    image: AdvancedNetworkImage(
                      authState.backgroundUrl,
                      useDiskCache: true,
                    ),
                  )
                : Container(
                    height: 140.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.1, 0.5, 0.7, 0.9],
                        colors: [
                          Colors.blue[800],
                          Colors.blue[700],
                          Colors.blue[600],
                          Colors.blue[400],
                        ],
                      ),
                    ),
                  ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 18.0,
                ),
                child: Row(
                  children: <Widget>[
                    AvatarWidget(
                      author: Author.fromAuthState(
                          avatarUrl: authState.loggedIn
                              ? authState.avatarUrl
                              : "https://www.wykop.pl/cdn/c3397992/avatar_def.png",
                          username: authState.login,
                          color: authState.color),
                      size: 84.0,
                      genderVisibility: false,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 12.0,
                          top: 36.0,
                          right: 12.0,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                authState.loggedIn
                                    ? authState.login
                                    : "Zaloguj się",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: authState.loggedIn
                                      ? Utils.getAuthorColor(
                                          Author.fromAuthState(
                                              avatarUrl: authState.avatarUrl,
                                              username: authState.login,
                                              color: authState.color),
                                          context)
                                      : Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                authState.loggedIn
                                    ? "Kliknij, aby zobaczyć swój profil"
                                    : "Kliknij, aby zalogować się",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _drawButtonsList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Theme.of(context).textTheme.caption.color.withOpacity(0.8),
          height: 0.1,
        ),
        _drawButton(context, "Mój profil", Icons.account_circle, () {}),
        _drawButton(context, "Historia wyszukiwania", Icons.history, () {}),
        _drawSeparator(context, "USTAWIENIA APLIKACJI"),
        _drawButton(context, "Wygląd", Icons.palette, () {}),
        _drawButton(context, "Tekst i obrazki", Icons.message, () {}),
        _drawButton(context, "Powiadomienia", Icons.notifications, () {}),
        _drawButton(context, "Zachowanie", Icons.settings, () {}),
        _drawSeparator(context, "INFORMACJE APLIKACJI - 1.0.0"),
        _drawButton(context, "Zgłoś błąd", Icons.bug_report, () {}),
        _drawButton(context, "Wsparcie", Icons.monetization_on, () {}),
        _drawButton(context, "O aplikacji", Icons.info, () {}),
      ],
    );
  }

  Widget _drawSeparator(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 18.0,
      ),
      color: Color(0x267f7f7f),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.caption.color.withOpacity(0.5),
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _drawButton(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 18.0,
              ),
              child: Icon(
                icon,
                size: 22.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawLogoutButton() {
    return StoreConnector<AppState, AuthState>(
      onInit: (store) => store.dispatch(syncStateWithApi()),
      converter: (store) => store.state.authState,
      builder: (context, authState) {
        return StoreConnector<AppState, LoginCallback>(
          converter: (store) =>
              (login, token) => store.dispatch(loginUser(token, login)),
          builder: (context, callback) {
            return InkResponse(
              onTap: () async {
                if (authState.loggedIn) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("TODO Logout"),
                    ),
                  );
                } else {
                  var result = await platform.invokeMethod(
                      'openLoginScreen', Map.from({'appKey': api.getAppKey()}));
                  callback(result['login'], result['token']);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: Icon(
                        Icons.exit_to_app,
                      ),
                    ),
                    Text(
                      authState.loggedIn ? "Wyloguj" : "Zaloguj",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _drawThemeButton() {
    return StoreConnector<AppState, OWMTheme>(
      converter: (store) => store.state.themeState.currentTheme,
      builder: (context, currentTheme) => StoreConnector<AppState, dynamic>(
            converter: (store) =>
                (OWMTheme theme) => store.dispatch(setTheme(theme)),
            builder: (context, callback) => IconButton(
                  onPressed: () => callback(currentTheme == OWMTheme.DARK_THEME
                      ? OWMTheme.LIGHT_THEME
                      : OWMTheme.DARK_THEME),
                  icon: Icon(
                    currentTheme == OWMTheme.DARK_THEME
                        ? Icons.wb_sunny
                        : Icons.brightness_2,
                  ),
                  tooltip: currentTheme == OWMTheme.DARK_THEME
                      ? "Styl dzienny"
                      : "Styl nocny",
                ),
          ),
    );
  }
}
