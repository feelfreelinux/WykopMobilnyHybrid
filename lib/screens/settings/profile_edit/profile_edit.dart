import 'package:flutter/material.dart';
import 'package:owmflutter/model/shadow_control_model.dart';
import 'package:owmflutter/screens/settings/profile_edit/avatar_profile_edit.dart';
import 'package:owmflutter/screens/settings/profile_edit/background_profile_edit.dart';
import 'package:owmflutter/screens/settings/profile_edit/info_profile_edit.dart';
import 'package:owmflutter/screens/settings/profile_edit/password_profile_edit.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreen createState() => _ProfileEditScreen();
}

class _ProfileEditScreen extends State<ProfileEditScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    InfoProfileEdit(),
    AvatarProfileEdit(),
    BackgroundProfileEdit(),
    PasswordProfileEdit(),
  ];

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    //TODO: Zrobić tak żeby działało z API
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          appBar: AppbarNormalWidget(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            leading: RoundIconButtonWidget(
              icon: Icons.arrow_back,
              onTap: () => Navigator.of(context).pop(),
              iconSize: 26.0,
              iconPadding: EdgeInsets.all(5.0),
            ),
            title: "Edytuj profil",
            bottomHeight: 38,
            bottom: Padding(
              padding: EdgeInsets.only(bottom: 10.0, left: 18.0, right: 18.0),
              child: Row(
                children: <Widget>[
                  TabButtonWidget(
                    text: "Profil",
                    index: 0,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 0;
                    }),
                  ),
                  TabButtonWidget(
                    text: "Avatar",
                    index: 1,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 1;
                    }),
                  ),
                  TabButtonWidget(
                    text: "Tło",
                    index: 2,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 2;
                    }),
                  ),
                  TabButtonWidget(
                    text: "Hasło",
                    index: 3,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 3;
                    }),
                  ),
                ],
              ),
            ),
          ),
          body: ShadowNotificationListener(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: _children[_currentIndex],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
