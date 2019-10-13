import 'dart:async';

import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    MikroblogScreen(),
    MyWykopScreen(),
    NotificationsScreen(),
  ];

  StreamSubscription<int> _screenSub;

  @override
  void initState() { 
    _screenSub = Provider.of<OWMSettings>(context, listen: false).defaultAppScreenStream.listen((e) => {
      setState(() {
        _currentIndex = e;
      })
    });
    _currentIndex = Provider.of<OWMSettings>(context, listen: false).defaultAppScreen;
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

    return MediaQuery(
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconButton(Icons.home, 0, "Strona główna"),
              _iconButton(Icons.add_box, 1, "Mikroblog"),
              _addMenuButton(Icons.create, "Dodaj"),
              _iconButton(Icons.loyalty, 2, "Mój Wykop"),
              _iconButton(Icons.mail, 3, "Powiadomienia",
                  badge: 0), //TODO: display number of notifications
            ],
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
        backgroundColor: Theme.of(context).iconTheme.color.withOpacity(0.40),
        elevation: 0.0,
        onPressed: () => _showWriteBottomSheet(context),
      ),
    );
  }

  void _showWriteBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final mqData = MediaQuery.of(context);
        final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

        return MediaQuery(
          data: mqDataNew,
          child: NotLoggedWidget(
            icon: Icons.account_circle,
            fullText: "Dodawanie treści będzie możliwe po zalogowaniu.",
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
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
                  SizedBox(height: 12.0),
                  Row(
                    children: <Widget>[
                      _addButton(
                        icon: OwmGlyphs.ic_buttontoolbar_wykop,
                        title: "ZNALEZISKO",
                        onPressed: () {}, //TODO: new link screen
                      ),
                      _addButton(
                        icon: Icons.add_box,
                        title: "WPIS",
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                              Utils.getPageTransition(EntryInputScreen()));
                        },
                      ),
                      _addButton(
                        icon: Icons.mail,
                        title: "WIADOMOŚĆ",
                        onPressed: () => _showPmDialog(context),
                      ),
                    ],
                  ),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    child: FloatingActionButton(
                      child: Icon(Icons.close),
                      backgroundColor:
                          Theme.of(context).iconTheme.color.withOpacity(0.40),
                      elevation: 0.0,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
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

  Widget _addButton({IconData icon, String title, VoidCallback onPressed}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 4.0),
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              elevation: 0.0,
              highlightElevation: 8.0,
              onPressed: onPressed,
              child: Icon(icon, size: 28.0),
              backgroundColor: Theme.of(context).accentColor,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Theme.of(context).backgroundColor,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, num index, String tooltip,
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
                child: Icon(
                  icon,
                  size: 28.0,
                  color: _currentIndex == index
                      ? Theme.of(context).iconTheme.color
                      : Theme.of(context).iconTheme.color.withOpacity(0.40),
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
