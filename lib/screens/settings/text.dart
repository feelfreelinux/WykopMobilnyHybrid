import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TextSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<ShadowControlModel>(
      create: (context) => ShadowControlModel(),
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppbarNormalWidget(
            title: "Tekst",
          ),
          body: ShadowNotificationListener(
              child: SingleChildScrollView(child: _drawList())),
        ),
      ),
    );
  }

  Widget _drawList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.shortLongBodyStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.shortLongBody,
              title: Text("Przytnij długi wpis"),
              subtitle: Text("Dostępne tylko w mikroblogu"),
              onChanged: (value) =>
                  settings.shortLongBody = !settings.shortLongBody,
            );
          },
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.openSpoilerDialogStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.openSpoilerDialog,
              title: Text("Otwórz spoiler w okienku"),
              onChanged: (value) =>
                  settings.openSpoilerDialog = !settings.openSpoilerDialog,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.openSpoilerDialogStream,
          builder: (context, settings) => Visibility(
            visible: !settings.openSpoilerDialog,
            child: OWMSettingListener(
              rebuildOnChange: (settings) => settings.hideSpoilerTextStream,
              builder: (context, settings) {
                return SwitchListTile(
                  value: settings.hideSpoilerText,
                  title: Text("Ukryj spoiler klikając w treść"),
                  onChanged: (value) =>
                      settings.hideSpoilerText = !settings.hideSpoilerText,
                );
              },
            ),
          ),
        ),
        DividerWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text("Wielkość tekstu", style: TextStyle(fontSize: 16.0)),
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.textSizeStream,
          builder: (context, settings) {
            return Column(
              children: <Widget>[
                RadioListTile(
                  groupValue: settings.textSize,
                  onChanged: (double value) => settings.textSize = value,
                  value: 0.8,
                  title: Text("Mały", textScaleFactor: 0.8),
                ),
                RadioListTile(
                  groupValue: settings.textSize,
                  onChanged: (double value) => settings.textSize = value,
                  value: 1.0,
                  title: Text("Normalny", textScaleFactor: 1.0),
                ),
                RadioListTile(
                  groupValue: settings.textSize,
                  onChanged: (double value) => settings.textSize = value,
                  value: 1.2,
                  title: Text("Duży", textScaleFactor: 1.2),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
