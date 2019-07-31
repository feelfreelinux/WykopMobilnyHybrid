import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_button.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BackgroundProfileEdit extends StatefulWidget {
  _BackgroundProfileEditState createState() => _BackgroundProfileEditState();
}

class _BackgroundProfileEditState extends State<BackgroundProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Aby tło profilu było w najlepszej jakości, dodaj grafikę o rozmiarze minimum 1266x200px"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 140.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff2e6e99),
                          Color(0xff4383af),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        authStateModel.backgroundUrl != null,
                    child: Container(
                      height: 140.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AdvancedNetworkImage(
                            authStateModel.backgroundUrl,
                            useDiskCache: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Wybierz nowe tło:"),
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
