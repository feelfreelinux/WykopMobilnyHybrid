import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/main.dart';

import 'package:provider/provider.dart';

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
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) => authStateModel.loggedIn
          ? child
          : Center(
              child: GestureDetector(
                onTap: () async {
                  var result = await platform.invokeMethod(
                      'openLoginScreen', Map.from({'appKey': api.getAppKey()}));
                  await authStateModel.loginUser(
                      result['login'], result['token']);
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
  }
}
