import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/services.dart';

class AppbarUserWidget extends StatelessWidget {
  static const platform =
      const MethodChannel('feelfreelinux.github.io/owmhybrid');
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: StoreConnector<AppState, AuthState>(
            onInit: (store) => store.dispatch(syncStateWithApi()),
            converter: (store) => store.state.authState,
            builder: (context, authState) {
              return StoreConnector<AppState, LoginCallback>(
                  converter: (store) =>
                      (login, token) => store.dispatch(loginUser(token, login)),
                  builder: (context, callback) {
                    return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (authState.loggedIn) {
                            Navigator.of(context).push(Utils.getPageTransition(MainSettingsScreen()));
                          } else {
                            var result = await platform.invokeMethod(
                                'openLoginScreen',
                                Map.from({'appKey': api.getAppKey()}));
                            callback(result['login'], result['token']);
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(authState.loggedIn
                                        ? authState.avatarUrl
                                        : "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png")))));
                  });
            }));
  }
}
