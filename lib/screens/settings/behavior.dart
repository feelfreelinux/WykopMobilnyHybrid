import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BehaviorSettingScreen extends StatelessWidget {
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
            title: "Zachowanie aplikacji",
            shadow: true,
          ),
          body: SingleChildScrollView(child: _drawList(context)),
        ),
      ),
    );
  }

  Widget _drawList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.defaultAppScreenStream,
          builder: (context, settings) => ListTile(
            title: Text("Domyślny ekran Aplikacji"),
            subtitle:
                Text(_defaultAppScreenSubtitle(settings.defaultAppScreen)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Domyślny ekran Aplikacji",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      OWMSettingListener(
                        rebuildOnChange: (settings) =>
                            settings.defaultAppScreenStream,
                        builder: (context, settings) => Column(
                          children: <Widget>[
                            RadioListTile(
                              groupValue: settings.defaultAppScreen,
                              onChanged: (value) {
                                settings.defaultAppScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 0,
                              title: Text("Znaleziska"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultAppScreen,
                              onChanged: (value) {
                                settings.defaultAppScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 1,
                              title: Text("Mikroblog"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultAppScreen,
                              onChanged: (value) {
                                settings.defaultAppScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 2,
                              title: Text("Mój Wykop"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultAppScreen,
                              onChanged: (value) {
                                settings.defaultAppScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 3,
                              title: Text("Powiadomienia"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.defaultLinkScreenStream,
          builder: (context, settings) => ListTile(
            title: Text("Domyślny ekran Znalezisk"),
            subtitle:
                Text(_defaultLinkScreenSubtitle(settings.defaultLinkScreen)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Domyślny ekran Znalezisk",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      OWMSettingListener(
                        rebuildOnChange: (settings) =>
                            settings.defaultLinkScreenStream,
                        builder: (context, settings) => Column(
                          children: <Widget>[
                            RadioListTile(
                              groupValue: settings.defaultLinkScreen,
                              onChanged: (value) {
                                settings.defaultLinkScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 0,
                              title: Text("Strona główna"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultLinkScreen,
                              onChanged: (value) {
                                settings.defaultLinkScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 1,
                              title: Text("Wykopalisko"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultLinkScreen,
                              onChanged: (value) {
                                settings.defaultLinkScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 2,
                              title: Text("Hity"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultLinkScreen,
                              onChanged: (value) {
                                settings.defaultLinkScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 3,
                              title: Text("Ulubione"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.defaultEntryScreenStream,
          builder: (context, settings) => ListTile(
            title: Text("Domyślny ekran Mikrobloga"),
            subtitle:
                Text(_defaultEntryScreenSubtitle(settings.defaultEntryScreen)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Domyślny ekran Mikrobloga",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      OWMSettingListener(
                        rebuildOnChange: (settings) =>
                            settings.defaultEntryScreenStream,
                        builder: (context, settings) => Column(
                          children: <Widget>[
                            RadioListTile(
                              groupValue: settings.defaultEntryScreen,
                              onChanged: (value) {
                                settings.defaultEntryScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 0,
                              title: Text("Nowe"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultEntryScreen,
                              onChanged: (value) {
                                settings.defaultEntryScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 1,
                              title: Text("Aktywne"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultEntryScreen,
                              onChanged: (value) {
                                settings.defaultEntryScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 2,
                              title: Text("Gorące 6h"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultEntryScreen,
                              onChanged: (value) {
                                settings.defaultEntryScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 3,
                              title: Text("Gorące 12h"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultEntryScreen,
                              onChanged: (value) {
                                settings.defaultEntryScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 4,
                              title: Text("Gorące 24h"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultEntryScreen,
                              onChanged: (value) {
                                settings.defaultEntryScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 5,
                              title: Text("Ulubione"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.defaultMyWykopScreenStream,
          builder: (context, settings) => ListTile(
            title: Text("Domyślny ekran Mojego wykopu"),
            subtitle: Text(
                _defaultMyWykopScreenSubtitle(settings.defaultMyWykopScreen)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Domyślny ekran Mojego wykopu",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      OWMSettingListener(
                        rebuildOnChange: (settings) =>
                            settings.defaultMyWykopScreenStream,
                        builder: (context, settings) => Column(
                          children: <Widget>[
                            RadioListTile(
                              groupValue: settings.defaultMyWykopScreen,
                              onChanged: (value) {
                                settings.defaultMyWykopScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 0,
                              title: Text("Mój Wykop"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultMyWykopScreen,
                              onChanged: (value) {
                                settings.defaultMyWykopScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 1,
                              title: Text("Tagi"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultMyWykopScreen,
                              onChanged: (value) {
                                settings.defaultMyWykopScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 2,
                              title: Text("Użytkownicy"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultMyWykopScreen,
                              onChanged: (value) {
                                settings.defaultMyWykopScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 3,
                              title: Text("Lista tagów"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) =>
              settings.defaultNotificationScreenStream,
          builder: (context, settings) => ListTile(
            title: Text("Domyślny ekran Powiadomień"),
            subtitle: Text(_defaultNotificationScreenSubtitle(
                settings.defaultNotificationScreen)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Domyślny ekran Powiadomień",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      OWMSettingListener(
                        rebuildOnChange: (settings) =>
                            settings.defaultNotificationScreenStream,
                        builder: (context, settings) => Column(
                          children: <Widget>[
                            RadioListTile(
                              groupValue: settings.defaultNotificationScreen,
                              onChanged: (value) {
                                settings.defaultNotificationScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 0,
                              title: Text("Wiadomości"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultNotificationScreen,
                              onChanged: (value) {
                                settings.defaultNotificationScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 1,
                              title: Text("Powiadomienia"),
                            ),
                            RadioListTile(
                              groupValue: settings.defaultNotificationScreen,
                              onChanged: (value) {
                                settings.defaultNotificationScreen = value;
                                Navigator.of(context).pop();
                              },
                              value: 2,
                              title: Text("Tagi"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.linkOpenBrowserStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.linkOpenBrowser,
              title: Text("Otwórz link w domyślnej przeglądarce"),
              onChanged: (value) =>
                  settings.linkOpenBrowser = !settings.linkOpenBrowser,
            );
          },
        ),
        DividerWidget(padding: EdgeInsets.only(bottom: 8.0)),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.hideCommentLinkStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.hideCommentLink,
              title: Text("Zwiń komentarze w znaleziskach"),
              subtitle: Text(
                  "Odpowiedzi zostaną wyświetlone po kliknięciu w przycisk rozwijania"),
              onChanged: (value) =>
                  settings.hideCommentLink = !settings.hideCommentLink,
            );
          },
        ),
        DividerWidget(padding: EdgeInsets.only(top: 8.0)),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.hideAdultImageStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.hideAdultImage,
              title: Text("Ukryj treści z oznaczeniem 18+"),
              onChanged: (value) =>
                  settings.hideAdultImage = !settings.hideAdultImage,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.hideNsfwImageStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.hideNsfwImage,
              title: Text("Ukryj treści z tagiem #nsfw"),
              onChanged: (value) =>
                  settings.hideNsfwImage = !settings.hideNsfwImage,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.expandNewbieContentStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.expandNewbieContent,
              title: Text("Zwiń treści \"zielonek\""),
              onChanged: (value) =>
                  settings.expandNewbieContent = !settings.expandNewbieContent,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.expandNoTagContentStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.expandNoTagContent,
              title: Text("Zwiń treści bez tagów"),
              subtitle: Text("Dostępne tylko w mikroblogu"),
              onChanged: (value) =>
                  settings.expandNoTagContent = !settings.expandNoTagContent,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.hideExpandContentStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.hideExpandContent,
              title: Text("Nie wyświetlaj zwiniętych treści"),
              onChanged: (value) =>
                  settings.hideExpandContent = !settings.hideExpandContent,
            );
          },
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.confirmDeleteStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.confirmDelete,
              title: Text("Potwierdź usunięcie"),
              onChanged: (value) =>
                  settings.confirmDelete = !settings.confirmDelete,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.confirmSendStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.confirmSend,
              title: Text("Potwierdź wysłanie"),
              onChanged: (value) =>
                  settings.confirmSend = !settings.confirmSend,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.confirmExitWritingStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.confirmExitWriting,
              title: Text("Potwierdź wyjście w trakcie pisania"),
              onChanged: (value) =>
                  settings.confirmExitWriting = !settings.confirmExitWriting,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.confirmExitAppStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.confirmExitApp,
              title: Text("Potwierdź wyjście z aplikacji"),
              onChanged: (value) =>
                  settings.confirmExitApp = !settings.confirmExitApp,
            );
          },
        ),
      ],
    );
  }

  String _defaultAppScreenSubtitle(int i) {
    if (i == 1) {
      return "Mikroblog";
    } else if (i == 2) {
      return "Mój Wykop";
    } else if (i == 3) {
      return "Powiadomienia";
    } else {
      return "Znaleziska";
    }
  }

  String _defaultLinkScreenSubtitle(int i) {
    if (i == 1) {
      return "Wykopalisko";
    } else if (i == 2) {
      return "Hity";
    } else if (i == 3) {
      return "Ulubione";
    } else {
      return "Strona główna";
    }
  }

  String _defaultEntryScreenSubtitle(int i) {
    if (i == 1) {
      return "Aktywne";
    } else if (i == 2) {
      return "Gorące 6h";
    } else if (i == 3) {
      return "Gorące 12h";
    } else if (i == 4) {
      return "Gorące 24h";
    } else if (i == 5) {
      return "Ulubione";
    } else {
      return "Nowe";
    }
  }

  String _defaultMyWykopScreenSubtitle(int i) {
    if (i == 1) {
      return "Tagi";
    } else if (i == 2) {
      return "Użytkownicy";
    } else if (i == 3) {
      return "Lista tagów";
    } else {
      return "Mój Wykop";
    }
  }

  String _defaultNotificationScreenSubtitle(int i) {
    if (i == 1) {
      return "Powiadomienia";
    } else if (i == 2) {
      return "Tagi";
    } else {
      return "Wiadomości";
    }
  }
}
