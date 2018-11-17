import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:owmflutter/api/api.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  bool loggedIn = false;
  String token = "";
  String login = "";

  @override
  void initState() {
    super.initState();
    final flutterWebviewPlugin = new FlutterWebviewPlugin();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      // Extract token, dispatch action to redux
      if (url.contains('ConnectSuccess')) {
        var login =
            url.substring(url.indexOf("/login/") + 7, url.indexOf("/token/"));
        var token =
            url.substring(url.indexOf("/token/") + 7, url.lastIndexOf("/"));
        this.setState(() {
          this.login = login;
          this.token = token;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: "https://a2.wykop.pl/login/connect/appkey/${api.getAppKey()}",
      appBar: new AppBar(
        title: new Text("Zaloguj się"),
      ),
    );
  }
}
