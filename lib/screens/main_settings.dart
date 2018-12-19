import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class MainSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Ustawienia', style: TextStyle(fontSize: 16.0)),
            elevation: 1.5,
            centerTitle: true,
            titleSpacing: 0.0),
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StoreConnector<AppState, AuthState>(
                converter: (store) => store.state.authState,
                builder: (context, authState) {
                  return Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AdvancedNetworkImage(
                                    authState.backgroundUrl,
                                    useDiskCache: true))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 42),
                              child: AvatarWidget(
                                  author: Author.fromAuthState(
                                      avatarUrl: authState.avatarUrl,
                                      username: authState.login,
                                      color: authState.color),
                                  size: 100,
                                  genderVisibility: false),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 16,
                            decoration: new BoxDecoration(
                                color: Theme.of(context).canvasColor,
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(40.0),
                                    topRight: const Radius.circular(40.0)))),
                      ),
                    ],
                  );
                },
              ),
              Container(
                height: 2,
                color: Theme.of(context).backgroundColor,
                width: MediaQuery.of(context).size.width,
              ),
              _renderThemeSwitch(context),
              _renderSetting("Twój profil", context),
              _renderSetting("Ustawienia wyglądu", context),
              _renderSetting("Zgłoś błąd", context),
              _renderSetting("Wyślij pytanie", context),
              _renderSetting("O aplikacji", context),
              Expanded(child: Container()),
              Container(
                height: 2,
                color: Theme.of(context).backgroundColor,
                width: MediaQuery.of(context).size.width,
              ),
              _renderSetting("Wyloguj się", context, textColor: Colors.red),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text("Otwarty wykop hybrydowy | MIT"),
              )
            ],
          ),
        ));
  }

  Widget _renderThemeSwitch(BuildContext context) {
    return StoreConnector<AppState, OWMTheme>(
      converter: (store) => store.state.themeState.currentTheme,
      builder: (context, currentTheme) => StoreConnector<AppState, dynamic>(
            converter: (store) =>
                (OWMTheme theme) => store.dispatch(setTheme(theme)),
            builder: (context, callback) =>
                _renderSetting("Włącz nocny", context,
                    actionWidget: Switch(
                        value: currentTheme == OWMTheme.DARK_THEME,
                        onChanged: (value) {
                          callback(value == true
                              ? OWMTheme.DARK_THEME
                              : OWMTheme.LIGHT_THEME);
                        })),
          ),
    );
  }

  Widget _renderSetting(String title, BuildContext context,
      {Color textColor, VoidCallback onTap, Widget actionWidget}) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onTap ?? () {},
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.body1.color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(),
                  ),
                  actionWidget ?? Container(),
                ],
              )),
        ),
        Container(
          height: 2,
          color: Theme.of(context).backgroundColor,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
