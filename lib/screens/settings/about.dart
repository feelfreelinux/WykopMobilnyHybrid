import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppbarNormalWidget(title: "O aplikacji"),
          body: ShadowNotificationListener(
            child: SingleChildScrollView(child: _drawList()),
          ),
        ),
      ),
    );
  }

  Widget _drawList() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Image(
            width: 128.0,
            height: 128.0,
            image: AssetImage('assets/app_icon.png'),
          ),
        ),
        Text(
          "Otwarty Wykop Mobilny",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Wersja 0.0.0-hybrid"), //TODO: get build version
        ),
        SizedBox(height: 8.0),
        ListTile(
          title: Text("Co nowego?"),
          trailing: Icon(Icons.chevron_right),
          onTap: () {}, //TODO: show whats new
        ),
        ListTile(
          title: Text("Patroni"),
          trailing: Icon(Icons.chevron_right),
          onTap: () {}, //TODO: show patrons
        ),
        ListTile(
          title: Text("Obserwuj tag"),
          trailing: Icon(Icons.chevron_right),
          onTap: () =>
              Utils.launchURL("https://www.wykop.pl/tag/otwartywykopmobilny/"),
        ),
        Divider(indent: 16.0, endIndent: 16.0),
        ListTile(
          title: Text("Github"),
          trailing: Icon(Icons.chevron_right),
          onTap: () =>
              Utils.launchURL("https://github.com/feelfreelinux/WykopMobilnyHybrid"),
        ),
        ListTile(
          title: Text("Discord"),
          trailing: Icon(Icons.chevron_right),
          onTap: () => Utils.launchURL("https://discord.gg/WgQZJD3"),
        ),
        Divider(indent: 16.0, endIndent: 16.0),
        ListTile(
          title: Text("Licencja MIT"),
          trailing: Icon(Icons.chevron_right),
          onTap: () => Utils.launchURL(
              "https://github.com/feelfreelinux/WykopMobilny/blob/master/LICENSE"),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
