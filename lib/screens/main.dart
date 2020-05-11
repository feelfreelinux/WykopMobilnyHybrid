import 'dart:async';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/app.dart';
import 'package:owmflutter/model/notifications_count_model.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final int defaultScreenIndex;

  MainScreen({this.defaultScreenIndex = 0});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> _children;

  StreamSubscription<int> _screenSub;

  @override
  void initState() {
    _currentIndex = widget.defaultScreenIndex;
    _children = [
      HomeScreen(),
      MikroblogScreen(),
      MyWykopScreen(),
      NotificationsScreen(
        initialIndex: widget.defaultScreenIndex == 3 ? 1 : 0,
      ),
    ];
    _screenSub = Provider.of<OWMSettings>(context, listen: false)
        .defaultAppScreenStream
        .listen((e) => {
              setState(() {
                _currentIndex = e;
              })
            });
    _currentIndex =
        Provider.of<OWMSettings>(context, listen: false).defaultAppScreen;
    super.initState();
  }

  @override
  void dispose() {
    _screenSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return WillPopScope(
      onWillPop: () async {
        if (owmSettings.confirmExitApp) {
          return await showConfirmDialog(context, "Zamknąć aplikację?");
        }
        return true;
      },
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          key: OwmKeys.mainScaffoldKey,
          body: _children[_currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Consumer<NotificationsCountModel>(
              builder: (context, notifsModel, _) => Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _iconsButton(
                    CommunityMaterialIcons.home_variant,
                    CommunityMaterialIcons.home_variant_outline,
                    0,
                    "Strona główna",
                  ),
                  _iconsButton(
                    CommunityMaterialIcons.plus_circle,
                    CommunityMaterialIcons.plus_circle_outline,
                    1,
                    "Mikroblog",
                  ),
                  _addMenuButton(Icons.create, "Dodaj"),
                  _iconsButton(
                    CommunityMaterialIcons.tag_heart,
                    CommunityMaterialIcons.tag_heart_outline,
                    2,
                    "Mój Wykop",
                  ),
                  _iconsButton(
                    Icons.notifications,
                    Icons.notifications_none,
                    3,
                    "Powiadomienia",
                    badge: notifsModel.unreadNotificationsCount,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addMenuButton(IconData icons, String tooltip) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 36.0,
      height: 36.0,
      child: FloatingActionButton(
        child: Icon(icons, size: 22.0),
        tooltip: tooltip,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).iconTheme.color.withOpacity(0.5),
        elevation: 0.0,
        onPressed: () => _showWriteBottomSheet(context),
      ),
    );
  }

  void _showWriteBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        final mqData = MediaQuery.of(context);
        final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

        return MediaQuery(
          data: mqDataNew,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 0.0
                      : (MediaQuery.of(context).size.width / 5),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              boxShadow: [BoxShadow(blurRadius: 30, color: Colors.black38)],
            ),
            child: NotLoggedWidget(
              icon: Icons.account_circle,
              fullText: "Dodawanie treści będzie możliwe po zalogowaniu.",
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.scaleDown,
                    image: AssetImage("kosmo_bg.png"),
                    repeat: ImageRepeat.repeat,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.only(top: 16.0),
                        height: 4.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 10.0),
                      child: Row(
                        children: <Widget>[
                          _addButton(
                            CommunityMaterialIcons.link_variant,
                            "Znalezisko",
                            () {
                              Navigator.pop(context);
                            },
                          ),
                          _addButton(
                            CommunityMaterialIcons.plus_circle_outline,
                            "Wpis",
                            () {
                              Navigator.pop(context);
                              Navigator.of(context).push(
                                  Utils.getPageSlideToUp(EntryInputScreen()));
                            },
                          ),
                          _addButton(
                            CommunityMaterialIcons.email_outline,
                            "Wiadomość",
                            () => _showPmDialog(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showPmDialog(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (_) => GreatDialogWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Znajdź osobę do rozmowy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 18.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              decoration: BoxDecoration(
                color: Utils.backgroundGreyOpacity(context),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                cursorRadius: Radius.circular(20.0),
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  border: InputBorder.none,
                  hintText: "Wpisz nazwę użytkownika", //TODO: user suggestion
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: GestureDetector(
                onTap: () {}, //TODO: get pm screen
                child: Container(
                  constraints: BoxConstraints(minWidth: double.infinity),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Napisz wiadomość",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addButton(IconData icon, String title, VoidCallback onPressed) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: Colors.grey.withOpacity(0.4)),
              color: Theme.of(context).dialogBackgroundColor.withOpacity(0.5)),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Icon(icon, size: 30.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconsButton(
      IconData icon, IconData iconOutline, num index, String tooltip,
      {num badge = 0}) {
    return Tooltip(
      message: tooltip,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => setState(() => _currentIndex = index),
          borderRadius: BorderRadius.circular(100),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                width: 52.0,
                height: 52.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 3.0),
                child: Icon(
                  _currentIndex == index ? icon : iconOutline,
                  size: 28.0,
                  color: _currentIndex == index
                      ? Theme.of(context).iconTheme.color
                      : Theme.of(context).iconTheme.color.withOpacity(0.5),
                ),
              ),
              Positioned(
                top: 6.0,
                right: badge <= 9 ? 6.0 : 4.0,
                child: Visibility(
                  visible: badge != 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
                    child: Text(
                      badge <= 99 ? badge.toString() : "+99",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
