import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileModel profileModel;
  final String username;
  ProfileScreen({this.profileModel, this.username});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

typedef Future<dynamic> ProfileEndpointCallback(int page);

enum ProfileScreenType {
  ENTRY,
  LINKS,
  ENTRY_LINKS,
  ENTRY_COMMENTS,
  LINK_COMMENTS,
}

class ProfileTab {
  final WidgetBuilder childrenBuilder;
  final String title;
  final ProfileScreenType dataType;
  final ProfileEndpointCallback callback;
  final bool supportsPagination;

  ProfileTab(
      {this.childrenBuilder,
      this.dataType,
      this.title,
      this.callback,
      this.supportsPagination = true});
}

class ProfileScreenState extends State<ProfileScreen> {
  int screenIndex = 0;

  List<ProfileTab> tabs;

  ProfileModel _profileModel;
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  @override
  void initState() {
    _profileModel = (widget.profileModel ??
        (ProfileModel.fromUsername(widget.username)..loadFullProfile()));

    var username = _profileModel.author.login;
    tabs = [
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Wszystko",
        dataType: ProfileScreenType.ENTRY_LINKS,
        callback: (page) => api.profiles.getActions(username),
        supportsPagination: false,
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Linki",
        dataType: ProfileScreenType.LINKS,
        callback: (page) => api.profiles.getAddedLinks(page, username),
        supportsPagination: true,
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Wpisy",
        dataType: ProfileScreenType.ENTRY,
        callback: (page) => api.profiles.getEntries(page, username),
        supportsPagination: true,
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Skom. znaleziska",
        dataType: ProfileScreenType.LINKS,
        callback: (page) => api.profiles.getCommentedLinks(page, username),
        supportsPagination: true,
      ),
      ProfileTab(
          childrenBuilder: (context) => _drawBody(),
          title: "Kom. do znalezisk",
          dataType: ProfileScreenType.LINK_COMMENTS,
          callback: (page) => api.profiles.getLinkComments(page, username),
          supportsPagination: true),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Opub. znaleziska",
        dataType: ProfileScreenType.LINKS,
        callback: (page) => api.profiles.getPublishedLinks(page, username),
        supportsPagination: true,
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Skom. wpisy",
        dataType: ProfileScreenType.ENTRY,
        callback: (page) => api.profiles.getCommentedEntries(page, username),
        supportsPagination: true,
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Kom. do wpisów",
        dataType: ProfileScreenType.ENTRY_COMMENTS,
        callback: (page) => api.profiles.getEntryComments(page, username),
        supportsPagination: true,
      ),
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
      value: _profileModel,
      child: ChangeNotifierProvider<ShadowControlModel>(
        builder: (context) => ShadowControlModel(),
        child: MediaQuery(
          data: mqDataNew,
          child: Scaffold(
            body: SafeArea(
              key: ValueKey(tabs[screenIndex].title),
              child: tabs[screenIndex].childrenBuilder(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawBody() {
    var tab = tabs[screenIndex];
    if (tab.dataType == ProfileScreenType.ENTRY_LINKS) {
      return EntriesLinksList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => EntryLinkListmodel(
          loadNewEntryLinks: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.ENTRY) {
      return EntriesList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => EntryListModel(
          loadNewEntries: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.LINKS) {
      return LinksList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => LinkListModel(
          loadNewLinks: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.ENTRY_COMMENTS) {
      return EntryCommentsList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => EntryCommentsListModel(
          loadNewComments: tab.callback,
        ),
      );
    }
    if (tab.dataType == ProfileScreenType.LINK_COMMENTS) {
      return LinkCommentsList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => LinkCommentListModels(
          loadNewLinkComments: tab.callback,
        ),
      );
    }
    return Text("TODO");
  }

  Widget _drawHeaderButton(String text, bool isSelected, VoidCallback onTap,
      {EdgeInsets margin = EdgeInsets.zero}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 110,
        margin: margin,
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).accentColor
              : Utils.backgroundCommentButton(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black12)],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Theme.of(context).textTheme.body1.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _drawHeader() {
    return Consumer<ProfileModel>(
      builder: (context, profileModel, _) => !profileModel.isFullyLoaded
          ? CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 60.0),
                      color: Utils.backgroundGreyOpacity(context),
                      child: profileModel.backgroundUrl != null
                          ? Image(
                              height: 140.0,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              image: NetworkImage(profileModel.backgroundUrl),
                            )
                          : Container(
                              height: profileModel.backgroundUrl == null
                                  ? 90.0
                                  : 140.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.8),
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
                            _drawHeaderButton(
                              profileModel.isObserved
                                  ? "Obserwujesz"
                                  : "Obserwuj",
                              profileModel.isObserved,
                              () => profileModel.toggleObserve(),
                            ),
                            _drawHeaderButton(
                              "Odznaki",
                              false,
                              () {},
                              margin: EdgeInsets.only(top: 8.0, bottom: 10.0),
                            ),
                          ],
                        ),
                        AvatarWidget(
                          author: profileModel.author,
                          size: 74.0,
                          boxShadow: [
                            BoxShadow(blurRadius: 4.0, color: Colors.black12)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            _drawHeaderButton(
                              profileModel.isBlocked ? "Zablokowany" : "Blokuj",
                              profileModel.isBlocked,
                              () => profileModel.toggleBlock(),
                            ),
                            _drawHeaderButton(
                              "Szczegóły",
                              false,
                              () {},
                              margin: EdgeInsets.only(top: 8.0, bottom: 10.0),
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
                      color: Utils.getAuthorColor(
                          profileModel.author.color, context),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 6.0),
                  child: Text(
                    _profileModel.formatRankAndObservers(),
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
                SizedBox(height: 8.0)
              ],
            ),
    );
  }

  Widget _drawTabForIndex(int index) {
    return TabButtonWidget(
      text: tabs[index].title,
      index: index,
      currentIndex: screenIndex,
      onTap: () {
        setState(() {
          screenIndex = index;
        });
        if (index > 2) {
          Navigator.pop(context);
        }
      },
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
              key: ValueKey(tabs[screenIndex].title),
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
