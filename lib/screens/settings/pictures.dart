import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PicturesSettingScreen extends StatelessWidget {
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
            title: "Obrazki i multimedia",
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
          rebuildOnChange: (settings) => settings.useYoutubePlayerStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.useYoutubePlayer,
              title: Text("Wbudowany odtwarzacz YouTube"),
              subtitle: Text("Wyłącz, aby użyć aplikacji YouTube"),
              onChanged: (value) =>
                  settings.useYoutubePlayer = !settings.useYoutubePlayer,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.useOtherPlayerStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.useOtherPlayer,
              title: Text("Wbudowany odtwarzacz mediów"),
              subtitle: Text("Wyłącz, aby użyć aplikacji zewnętrznych"),
              onChanged: (value) =>
                  settings.useOtherPlayer = !settings.useOtherPlayer,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.useAutoplayStream,
          builder: (context, settings) => ListTile(
            title: Text("Autoodtwarzanie"),
            subtitle: Text(_useAutoplaySubtitle(settings.useAutoplay)),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Autoodtwarzanie",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      OWMSettingListener(
                        rebuildOnChange: (settings) =>
                            settings.useAutoplayStream,
                        builder: (context, settings) => Column(
                          children: <Widget>[
                            RadioListTile(
                              groupValue: settings.useAutoplay,
                              onChanged: (value) {
                                settings.useAutoplay = value;
                                Navigator.of(context).pop();
                              },
                              value: 0,
                              title: Text("Wyłączone"),
                            ),
                            RadioListTile(
                              groupValue: settings.useAutoplay,
                              onChanged: (value) {
                                settings.useAutoplay = value;
                                Navigator.of(context).pop();
                              },
                              value: 1,
                              title: Text("Tylko z Wi-Fi"),
                            ),
                            RadioListTile(
                              groupValue: settings.useAutoplay,
                              onChanged: (value) {
                                settings.useAutoplay = value;
                                Navigator.of(context).pop();
                              },
                              value: 2,
                              title: Text("Włączone"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.resolutionAvatarStream,
          builder: (context, settings) => ListTile(
            title: Text("Rozdzielczość avatarów"),
            subtitle:
                Text(_resolutionAvatarSubtitle(settings.resolutionAvatar)),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Rozdzielczość avatarów",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      OWMSettingListener(
                        rebuildOnChange: (settings) =>
                            settings.resolutionAvatarStream,
                        builder: (context, settings) => Column(
                          children: <Widget>[
                            RadioListTile(
                              groupValue: settings.resolutionAvatar,
                              onChanged: (value) {
                                settings.resolutionAvatar = value;
                                Navigator.of(context).pop();
                              },
                              value: 30,
                              title: Text("Niska"),
                            ),
                            RadioListTile(
                              groupValue: settings.resolutionAvatar,
                              onChanged: (value) {
                                settings.resolutionAvatar = value;
                                Navigator.of(context).pop();
                              },
                              value: 150,
                              title: Text("Średnia"),
                            ),
                            RadioListTile(
                              groupValue: settings.resolutionAvatar,
                              onChanged: (value) {
                                settings.resolutionAvatar = value;
                                Navigator.of(context).pop();
                              },
                              value: 300,
                              title: Text("Wysoka"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.highResImageLinkStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.highResImageLink,
              title: Text("Wysoka rozdzielczość miniaturek"),
              subtitle: Text("Dotyczy tylko znalezisk"),
              onChanged: (value) =>
                  settings.highResImageLink = !settings.highResImageLink,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.highResImageStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.highResImage,
              title: Text("Wysoka rozdzielczość obrazków"),
              onChanged: (value) =>
                  settings.highResImage = !settings.highResImage,
            );
          },
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.hiddingLinkThumbStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.hiddingLinkThumb,
              title: Text("Wyłącz miniaturkę znaleziska"),
              subtitle: Text("Nie będzie widoczna na liście"),
              onChanged: (value) =>
                  settings.hiddingLinkThumb = !settings.hiddingLinkThumb,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.hiddingEntryImageStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.hiddingEntryImage,
              title: Text("Ukryj obrazek wpisu"),
              subtitle: Text("Zostanie wyświetlony po kliknięciu"),
              onChanged: (value) =>
                  settings.hiddingEntryImage = !settings.hiddingEntryImage,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.hiddingCommentImageStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.hiddingCommentImage,
              title: Text("Ukryj obrazek w komentarzu"),
              subtitle: Text("Zostanie wyświetlony po kliknięciu"),
              onChanged: (value) =>
                  settings.hiddingCommentImage = !settings.hiddingCommentImage,
            );
          },
        ),
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.shortLongPictureStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.shortLongPicture,
              title: Text("Zwiń długi obrazek"),
              subtitle: Text("Jeśli jest dłuższy niż połowa ekranu"),
              onChanged: (value) =>
                  settings.shortLongPicture = !settings.shortLongPicture,
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.shortLongPictureStream,
          builder: (context, settings) {
            return Visibility(
              visible: settings.shortLongPicture,
              child: OWMSettingListener(
                rebuildOnChange: (settings) => settings.skipExpandImageStream,
                builder: (context, settings) {
                  return SwitchListTile(
                    value: settings.skipExpandImage,
                    title: Text("Pomiń rozwijanie obrazka"),
                    subtitle: Text("Otworzy się w pełnym ekranie"),
                    onChanged: (value) =>
                        settings.skipExpandImage = !settings.skipExpandImage,
                  );
                },
              ),
            );
          },
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.skipShowAdultImageStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.skipShowAdultImage,
              title: Text("Pomiń odsłanianie obrazka 18+"),
              subtitle: Text(
                  "Otworzy się w pełnym ekranie, po wyjściu będzie zasłonięty"),
              onChanged: (value) =>
                  settings.skipShowAdultImage = !settings.skipShowAdultImage,
            );
          },
        ),
        Padding(padding: EdgeInsets.only(top: 8.0)),
      ],
    );
  }

  String _useAutoplaySubtitle(int i) {
    if (i == 1) {
      return "Tylko z Wi-Fi";
    } else if (i == 2) {
      return "Włączone";
    } else {
      return "Wyłączone";
    }
  }

  String _resolutionAvatarSubtitle(int i) {
    if (i == 150) {
      return "Średnia";
    } else if (i == 2) {
      return "Wysoka";
    } else {
      return "Niska";
    }
  }
}
