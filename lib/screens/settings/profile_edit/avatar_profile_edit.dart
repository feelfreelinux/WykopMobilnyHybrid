import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_button.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AvatarProfileEdit extends StatefulWidget {
  _AvatarProfileEditState createState() => _AvatarProfileEditState();
}

class _AvatarProfileEditState extends State<AvatarProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Aby Avatar był w najlepszej jakości, dodaj grafikę o rozmiarze minimum 150×150px"),
            ),
            AvatarWidget(
              author: Author.fromAuthState(
                  avatarUrl: authStateModel.avatarUrl ?? "",
                  username: authStateModel.login ?? "",
                  color: authStateModel.color ?? 0),
              size: 200,
              badge: Colors.transparent,
              genderVisibility: false,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Wybierz nowy Avatar:"),
                )),
                AppBarButton(
                  icon: Icons.photo,
                  round: true,
                  iconSize: 26.0,
                  iconPadding: EdgeInsets.all(8.0),
                ),
                AppBarButton(
                  icon: Icons.camera_alt,
                  round: true,
                  iconSize: 26.0,
                  iconPadding: EdgeInsets.all(8.0),
                )
              ],
            ),
            InputButtonWidget(text: "Zapisz"),
          ],
        );
      },
    );
  }
}
