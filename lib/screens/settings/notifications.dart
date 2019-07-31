import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NotificationsSettingScreen extends StatelessWidget {
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
          appBar: AppbarNormalWidget(
            title: "Powiadomienia",
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
          rebuildOnChange: (settings) => settings.useNotificationStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.useNotification,
              title: Text(settings.useNotification ? "Włączone" : "Wyłączone"),
              onChanged: (value) =>
                  settings.useNotification = !settings.useNotification,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.useNotificationStream,
          builder: (context, settings) => settings.useNotification
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    DividerWidget(padding: EdgeInsets.only(bottom: 8.0)),
                    OWMSettingListener(
                      rebuildOnChange: (settings) =>
                          settings.usePushNotificationStream,
                      builder: (context, settings) {
                        return SwitchListTile(
                          value: settings.usePushNotification,
                          title: Text("Przechwyć powiadomienia Push"),
                          subtitle: Text(
                              "Wymaga zainstalowania oficjalnej aplikacji Wykop.pl"),
                          onChanged: (value) => settings.usePushNotification =
                              !settings.usePushNotification,
                        );
                      },
                    ),
                    OWMSettingListener(
                      rebuildOnChange: (settings) =>
                          settings.timeCheckNotificationStream,
                      builder: (context, settings) {
                        return ListTile(
                          title: Text("Częstotliwość sprawdzania"),
                          subtitle: Text(_timeCheckNotificationSubtitle(
                              settings.timeCheckNotification)),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          "Częstotliwość sprawdzania",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      OWMSettingListener(
                                        rebuildOnChange: (settings) => settings
                                            .timeCheckNotificationStream,
                                        builder: (context, settings) {
                                          return Column(
                                            children: <Widget>[
                                              RadioListTile(
                                                groupValue: settings
                                                    .timeCheckNotification,
                                                onChanged: (value) {
                                                  settings.timeCheckNotification =
                                                      value;
                                                  Navigator.of(context).pop();
                                                },
                                                value: 15,
                                                title: Text("Co 15 minut"),
                                              ),
                                              RadioListTile(
                                                groupValue: settings
                                                    .timeCheckNotification,
                                                onChanged: (value) {
                                                  settings.timeCheckNotification =
                                                      value;
                                                  Navigator.of(context).pop();
                                                },
                                                value: 30,
                                                title: Text("Co 30 minut"),
                                              ),
                                              RadioListTile(
                                                groupValue: settings
                                                    .timeCheckNotification,
                                                onChanged: (value) {
                                                  settings.timeCheckNotification =
                                                      value;
                                                  Navigator.of(context).pop();
                                                },
                                                value: 60,
                                                title: Text("Co godzinę"),
                                              ),
                                              RadioListTile(
                                                groupValue: settings
                                                    .timeCheckNotification,
                                                onChanged: (value) {
                                                  settings.timeCheckNotification =
                                                      value;
                                                  Navigator.of(context).pop();
                                                },
                                                value: 120,
                                                title: Text("Co 2 godziny"),
                                              ),
                                              RadioListTile(
                                                groupValue: settings
                                                    .timeCheckNotification,
                                                onChanged: (value) {
                                                  settings.timeCheckNotification =
                                                      value;
                                                  Navigator.of(context).pop();
                                                },
                                                value: 240,
                                                title: Text("Co 4 godziny"),
                                              ),
                                              RadioListTile(
                                                groupValue: settings
                                                    .timeCheckNotification,
                                                onChanged: (value) {
                                                  settings.timeCheckNotification =
                                                      value;
                                                  Navigator.of(context).pop();
                                                },
                                                value: 480,
                                                title: Text("Co 8 godzin"),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      SizedBox(height: 18.0),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                      child: Text(
                        "Częstotliwość sprawdzania jest nieaktywna gdy włączone jest przechwytywanie powiadomień Push.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    DividerWidget(
                      padding: EdgeInsets.only(top: 8.0),
                    ),
                    OWMSettingListener(
                      rebuildOnChange: (settings) =>
                          settings.useSoundNotificationStream,
                      builder: (context, settings) {
                        return SwitchListTile(
                          value: settings.useSoundNotification,
                          title: Text("Dźwięk"),
                          onChanged: (value) => settings.useSoundNotification =
                              !settings.useSoundNotification,
                        );
                      },
                    ),
                    OWMSettingListener(
                      rebuildOnChange: (settings) =>
                          settings.useVibrationNotificationStream,
                      builder: (context, settings) {
                        return SwitchListTile(
                          value: settings.useVibrationNotification,
                          title: Text("Wibracje"),
                          onChanged: (value) =>
                              settings.useVibrationNotification =
                                  !settings.useVibrationNotification,
                        );
                      },
                    ),
                    DividerWidget(),
                    OWMSettingListener(
                      rebuildOnChange: (settings) => settings.useSoundAppStream,
                      builder: (context, settings) {
                        return SwitchListTile(
                          value: settings.useSoundApp,
                          title: Text("Dźwięki z aplikacji"),
                          onChanged: (value) =>
                              settings.useSoundApp = !settings.useSoundApp,
                        );
                      },
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Powiadomienia są wyłączone. Możesz nadal wysyłać i odbierać treści w aplikacji, ale nie będziesz otrzymywać powiadomień systemowych o nowych wiadomościach prywatnych lub zawołaniach we wpisach.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
        ),
      ],
    );
  }

  String _timeCheckNotificationSubtitle(int i) {
    if (i == 30) {
      return "Co 30 minut";
    } else if (i == 60) {
      return "Co godzinę";
    } else if (i == 120) {
      return "Co 2 godziny";
    } else if (i == 240) {
      return "Co 4 godziny";
    } else if (i == 480) {
      return "Co 8 godzin";
    } else {
      return "Co 15 minut";
    }
  }
}
