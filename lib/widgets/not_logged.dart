import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/main.dart';
import 'dart:async';

class NotLoggedWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String fullText;
  final Widget child;
  NotLoggedWidget({
    @required this.icon,
    this.text,
    this.fullText,
    @required this.child,
  });

  static const platform =
      const MethodChannel('feelfreelinux.github.io/owmhybrid');

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.authState,
      builder: (context, authState) {
        return authState.loggedIn
            ? child
            : Center(
                child: StoreConnector<AppState, LoginCallback>(
                  converter: (store) => (login, token, completer) =>
                      store.dispatch(loginUser(token, login, completer)),
                  builder: (context, loginCallback) => GestureDetector(
                        onTap: () async {
                          var result = await platform.invokeMethod(
                              'openLoginScreen',
                              Map.from({'appKey': api.getAppKey()}));
                          var completer = Completer();
                          loginCallback(
                              result['login'], result['token'], completer);
                          await completer.future;
                          RestartWidget.restartApp(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              icon,
                              size: 60.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 12.0,
                              ),
                              child: Text(
                                "Zaloguj się!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 12.0,
                              ),
                              child: Text(
                                text != null
                                    ? text + " będą widoczne po zalogowaniu."
                                    : fullText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Text(
                              "Kliknij, aby zalogować się.",
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey[500],
                              ),
                            )
                          ],
                        ),
                      ),
                ),
              );
      },
    );
  }
}
