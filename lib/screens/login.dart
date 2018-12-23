import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

typedef void LoginCallback(String login, String token);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginCallback>(
        converter: (store) =>
            (login, token) => store.dispatch(loginUser(token, login)),
        builder: (context, callback) {
          return InAppWebView(
              initialUrl:
                  "https://a2.wykop.pl/login/connect/appkey/${api.getAppKey()}",
              onLoadStart: (InAppWebViewController controller, String url) {
                if (url.contains('ConnectSuccess')) {
                  var login = url.substring(
                      url.indexOf("/login/") + 7, url.indexOf("/token/"));
                  var token = url.substring(
                      url.indexOf("/token/") + 7, url.lastIndexOf("/"));
                  callback(login, token);
                }
              });
        });
  }
}
