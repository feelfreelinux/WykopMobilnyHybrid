import 'package:flutter/material.dart';
import 'package:owmflutter/model/shadow_control_model.dart';
import 'package:owmflutter/screens/settings/profile_edit/avatar_profile_edit.dart';
import 'package:owmflutter/screens/settings/profile_edit/background_profile_edit.dart';
import 'package:owmflutter/screens/settings/profile_edit/info_profile_edit.dart';
import 'package:owmflutter/screens/settings/profile_edit/password_profile_edit.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
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

    //TODO: Zrobić tak żeby działało
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          appBar: AppbarNormalWidget(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            leading: AppBarButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.of(context).pop(),
              round: true,
              iconSize: 26.0,
              iconPadding: EdgeInsets.all(5.0),
            ),
            title: "Edytuj profil",
          ),
          body: ShadowNotificationListener(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: <Widget>[
                          _tabButton(text: "Profil", index: 0),
                          _tabButton(text: "Avatar", index: 1),
                          _tabButton(text: "Tło", index: 2),
                          _tabButton(text: "Hasło", index: 3),
                        ],
                      ),
                    ),
                    _children[_currentIndex],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabButton({String text, int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
          decoration: BoxDecoration(
              color: _currentIndex == index
                  ? Utils.backgroundGreyOpacity(context)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: _currentIndex == index
                    ? Theme.of(context).textTheme.body1.color
                    : Theme.of(context).textTheme.caption.color),
          ),
        ),
      ),
    );
  }
}
