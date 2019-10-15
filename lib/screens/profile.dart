import 'package:flutter/material.dart';
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
      ProfileTab(
          childrenBuilder: (context) => _drawBody(), title: "Znaleziska"),
      ProfileTab(childrenBuilder: (context) => _drawBody(), title: "Wpisy"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(),
          title: "Skom. znaleziska"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(),
          title: "Kom. do znalezisk"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(),
          title: "Opublikowane znaleziska"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(),
          title: "Skom. wpisy"),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(),
          title: "Kom. do wpisów"),
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
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.edit),
              onPressed: () {},
            ),
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
      builder: (context, profileModel, _) => Container(
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
      ),
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
