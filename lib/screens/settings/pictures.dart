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
            shadow: true,
          ),
          body: SingleChildScrollView(child: _drawList()),
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
        DividerWidget(),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.lowResAvatarStream,
          builder: (context, settings) {
            return SwitchListTile(
              value: settings.lowResAvatar,
              title: Text("Niska rozdzielczość Avatarów"),
              onChanged: (value) =>
                  settings.lowResAvatar = !settings.lowResAvatar,
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
}
