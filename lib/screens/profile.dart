import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileModel profileModel;
  ProfileScreen({this.profileModel});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileTab {
  final WidgetBuilder childrenBuilder;
  final String title;

  ProfileTab({this.childrenBuilder, this.title});
}

class ProfileScreenState extends State<ProfileScreen> {
  num screenIndex = 6;

  List<ProfileTab> tabs;

  @override
  void initState() {
    tabs = [
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Wszystko"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Linki"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Wpisy"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(), title: "Skom. znaleziska"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(),
          title: "Kom. do znalezisk"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(), title: "Opub. znaleziska"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(), title: "Skom. wpisy"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(), title: "Kom. do wpisów"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Powiązane"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(), title: "Obserwujący"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Obserwuje"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Odznaki"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Wykopane"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Zakopane"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return ChangeNotifierProvider<ProfileModel>.value(
      value: widget.profileModel,
      child: ChangeNotifierProvider<ShadowControlModel>(
        builder: (context) => ShadowControlModel(),
        child: MediaQuery(
          data: mqDataNew,
          child: Scaffold(
            body: SafeArea(
              child: tabs[screenIndex].childrenBuilder(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawBody() {
    return EntriesLinksList(
      header: _drawFloatingHeader(),
      persistentHeaderBuilder: (context) => _drawHeader(),
      builder: (context) => EntryLinkListmodel(
        loadNewEntryLinks: (page) =>
            api.profiles.getActions(widget.profileModel.author.login),
      ),
    );
  }

  Widget _drawHeader() {
    return Consumer<ProfileModel>(
      builder: (context, profileModel, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                color: Utils.backgroundGreyOpacity(context),
                child: profileModel.backgroundUrl != null
                    ? Image(
                        height: 140.0,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        image: NetworkImage(profileModel.backgroundUrl),
                      )
                    : Container(
                        height:
                            profileModel.backgroundUrl == null ? 90.0 : 140.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Theme.of(context).accentColor.withOpacity(0.8),
                              Theme.of(context).accentColor.withBlue(255)
                            ],
                          ),
                        ),
                      ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 110,
                        margin: EdgeInsets.only(top: 2.0),
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(blurRadius: 6.0, color: Colors.black26)
                          ],
                        ),
                        child: Text(
                          "Obserwuj",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 110,
                        margin: EdgeInsets.only(top: 8.0),
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(blurRadius: 6.0, color: Colors.black26)
                          ],
                        ),
                        child: Text(
                          "Odznaki",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  AvatarWidget(
                    author: profileModel.author,
                    size: 70.0,
                    boxShadow: [
                      BoxShadow(blurRadius: 6.0, color: Colors.black26)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 110,
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(blurRadius: 6.0, color: Colors.black26)
                          ],
                        ),
                        child: Text(
                          "Blokuj",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 110,
                        margin: EdgeInsets.only(top: 8.0),
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(blurRadius: 6.0, color: Colors.black26)
                          ],
                        ),
                        child: Text(
                          "Szczegóły",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RoundIconButtonWidget(
                      roundColor: Colors.black45,
                      iconColor: Colors.white,
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.of(context).pop(),
                      iconSize: 26.0,
                      iconPadding: EdgeInsets.all(5.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                    ),
                    RoundIconButtonWidget(
                      roundColor: Colors.black45,
                      iconColor: Colors.white,
                      icon: Icons.share,
                      iconSize: 20.0,
                      iconPadding: EdgeInsets.all(8.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 18.0, top: 14.0, right: 18.0),
            child: Text(
              profileModel.author.login,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Utils.getAuthorColor(profileModel.author.color, context),
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 6.0),
            child: Text(
              widget.profileModel.formatRankAndObservers(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Visibility(
            visible: profileModel.about != null,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 8.0),
              child: Text(
                profileModel.about ?? "",
                style: TextStyle(fontSize: 13.0),
              ),
            ),
          ),
          /*Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 8.0),
            child: Text(
              "Ban za chodzenie po wodzie lorem Ipsum printing and typesetting industry.",
              style: TextStyle(fontSize: 13.0, color: Colors.red),
            ),
          ),*/
          SizedBox(height: 8.0)
        ],
      ), /*
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          image: profileModel.backgroundUrl != null
              ? DecorationImage(
                  image: AdvancedNetworkImage(profileModel.backgroundUrl),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: RoundIconButtonWidget(
                roundColor: Colors.black.withOpacity(0.4),
                iconColor: Colors.white.withOpacity(0.5),
                icon: Icons.arrow_back,
                onTap: () => Navigator.of(context).pop(),
                iconSize: 26.0,
                iconPadding: EdgeInsets.all(5.0),
              ),
            ),
            Expanded(
              child: GestureDetector(
                // onTap: () => _showDialogWithBody(tagModel),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 16, bottom: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: AvatarWidget(
                            author: profileModel.author,
                            size: 36,
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  widget.profileModel.author.login,
                                  style: TextStyle(
                                      color: Utils.getAuthorColor(
                                          widget.profileModel.author.color,
                                          context),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Text(
                                widget.profileModel.formatRankAndObservers(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundIconButtonWidget(
                        padding: EdgeInsets.only(left: 8, right: 16, bottom: 8),
                        roundColor: Colors.black.withOpacity(0.4),
                        iconColor: Colors.white.withOpacity(0.5),
                        icon: Icons.lock,
                        onTap: () => Navigator.of(context).pop(),
                        iconSize: 22.0,
                        iconPadding: EdgeInsets.all(5.0),
                      ),
                      RoundIconButtonWidget(
                        padding: EdgeInsets.only(left: 8, right: 16),
                        roundColor: Colors.black.withOpacity(0.4),
                        iconColor: Colors.white.withOpacity(0.5),
                        icon: Icons.remove_red_eye,
                        onTap: () => Navigator.of(context).pop(),
                        iconSize: 22.0,
                        iconPadding: EdgeInsets.all(5.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),*/
    );
  }

  Widget _drawTabForIndex(int index) {
    return TabButtonWidget(
      text: tabs[index].title,
      index: index,
      currentIndex: screenIndex,
      onTap: () => setState(() => screenIndex = index),
    );
  }

  Widget _drawFloatingHeader() {
    return FloatingTabsHeader(
      children: <Widget>[
        _drawTabForIndex(0),
        _drawTabForIndex(1),
        _drawTabForIndex(2),
        TabButtonWidget(
          text: "Więcej",
          index: screenIndex > 2 ? screenIndex : -1,
          currentIndex: screenIndex,
          onTap: () => _openMoreTabsDialog(),
        ),
      ],
    );
  }

  void _openMoreTabsDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return GreatDialogWidget(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(3),
                      _drawTabForIndex(4),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(5),
                      _drawTabForIndex(6),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(7),
                      _drawTabForIndex(8),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(9),
                      _drawTabForIndex(10),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(11),
                      _drawTabForIndex(12),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
