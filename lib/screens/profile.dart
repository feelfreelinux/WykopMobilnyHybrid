import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/profile_related_list.dart';
import 'package:owmflutter/widgets/widgets.dart';

import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

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
  RELATED,
  FOLLOWERS,
}

class ProfileTab {
  final WidgetBuilder childrenBuilder;
  final String title;
  final ProfileScreenType dataType;
  final ProfileEndpointCallback callback;
  final bool supportsPagination;

  ProfileTab({
    this.childrenBuilder,
    this.dataType,
    this.title,
    this.callback,
    this.supportsPagination = true,
  });
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
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Wpisy",
        dataType: ProfileScreenType.ENTRY,
        callback: (page) => api.profiles.getEntries(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Opublikowane",
        dataType: ProfileScreenType.LINKS,
        callback: (page) => api.profiles.getPublishedLinks(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Powiązane",
        dataType: ProfileScreenType.RELATED,
        callback: (page) => api.profiles.getProfileRelated(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Skomentowane",
        dataType: ProfileScreenType.LINKS,
        callback: (page) => api.profiles.getCommentedLinks(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Komentarze",
        dataType: ProfileScreenType.LINK_COMMENTS,
        callback: (page) => api.profiles.getLinkComments(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Wykopane",
        dataType: ProfileScreenType.LINKS,
        callback: (page) => api.profiles.getDigged(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Zakopane",
        dataType: ProfileScreenType.LINKS,
        callback: (page) => api.profiles.getBuried(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Skomentowane",
        dataType: ProfileScreenType.ENTRY,
        callback: (page) => api.profiles.getCommentedEntries(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Komentarze",
        dataType: ProfileScreenType.ENTRY_COMMENTS,
        callback: (page) => api.profiles.getEntryComments(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Obserwujący",
        dataType: ProfileScreenType.FOLLOWERS,
        callback: (page) => api.profiles.getFollowers(page, username),
      ),
      ProfileTab(
        childrenBuilder: (context) => _drawBody(),
        title: "Obserwowani",
        dataType: ProfileScreenType.FOLLOWERS,
        callback: (page) => api.profiles.getFollowed(page, username),
      ),
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
        create: (context) => ShadowControlModel(),
        child: MediaQuery(
          data: mqDataNew,
          child: Scaffold(
            appBar: AppbarNormalWidget(
              leading: Container(),
              actions: <Widget>[],
              toolbarHeight: 0,
            ),
            body: SafeArea(
              top: false,
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
          context: context,
          loadNewEntryLinks: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.ENTRY) {
      return EntriesList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => EntryListModel(
          context: context,
          loadNewEntries: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.LINKS) {
      return LinksList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => LinkListModel(
          context: context,
          loadNewLinks: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.ENTRY_COMMENTS) {
      return EntryCommentsList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => EntryCommentsListModel(
          context: context,
          loadNewComments: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.LINK_COMMENTS) {
      return LinkCommentsList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => LinkCommentListModels(
          context: context,
          loadNewLinkComments: tab.callback,
        ),
      );
    }

    if (tab.dataType == ProfileScreenType.RELATED) {
      return ProfileRelatedList(
        header: _drawFloatingHeader(),
        persistentHeaderBuilder: (context) => _drawHeader(),
        builder: (context) => ProfileRelatedListModel(
          context: context,
          loadNewProfileRelateds: tab.callback,
        ),
      );
    }

    return Text("TODO"); // TODO: profile
  }

  Widget _drawHeaderButton(String text, bool isSelected, VoidCallback onTap,
      {EdgeInsets margin = EdgeInsets.zero, bool isDisabled = false}) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          alignment: Alignment.center,
          width: 110,
          margin: margin,
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).accentColor
                : Utils.backgroundGrey(context),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).cardColor, width: 2.5),
          ),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: isDisabled ? 0.5 : 1.0,
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
        ),
      ),
    );
  }

  Widget _drawHeader() {
    return Consumer<ProfileModel>(
      builder: (context, profileModel, _) => !profileModel.isFullyLoaded
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
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
                                    ? 70.0
                                    : 140.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  image: DecorationImage(
                                    alignment: Alignment.center,
                                    fit: BoxFit.scaleDown,
                                    image: AssetImage("kosmo_bg.png"),
                                    repeat: ImageRepeat.repeat,
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
                                  isDisabled: profileModel.isBlocked),
                              _drawHeaderButton(
                                "Odznaki",
                                false,
                                () {},
                                margin: EdgeInsets.only(top: 4.0, bottom: 5.0),
                              ),
                            ],
                          ),
                          AvatarWidget(
                            author: profileModel.author,
                            size: 75.0,
                            badge: Colors.transparent,
                          ),
                          Column(
                            children: <Widget>[
                              _drawHeaderButton(
                                  profileModel.isBlocked
                                      ? "Zablokowany"
                                      : "Blokuj",
                                  profileModel.isBlocked,
                                  () => profileModel.toggleBlock(),
                                  isDisabled: profileModel.isObserved),
                              _drawHeaderButton(
                                "Szczegóły",
                                false,
                                () {},
                                margin: EdgeInsets.only(top: 4.0, bottom: 5.0),
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
                              roundColor: Utils.backgroundRoundIconAppbarScroll(
                                  context),
                              iconColor:
                                  Utils.iconColorRoundIconAppbarScroll(context),
                              icon: Icons.arrow_back,
                              onTap: () => Navigator.of(context).pop(),
                              iconSize: 26.0,
                              iconPadding: EdgeInsets.all(5.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16.0),
                            ),
                            RoundIconButtonWidget(
                              roundColor: Utils.backgroundRoundIconAppbarScroll(
                                  context),
                              iconColor:
                                  Utils.iconColorRoundIconAppbarScroll(context),
                              icon: Icons.share,
                              iconSize: 20.0,
                              iconPadding: EdgeInsets.all(8.0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16.0),
                              onTap: () => Share.share(
                                  'https://wykop.pl/ludzie/' +
                                      _profileModel.author.login),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 18.0, top: 6.0, right: 18.0),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _profileModel.formatRankAndObservers(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Theme.of(context).textTheme.caption.color,
                          ),
                        ),
                        Text(
                          " • " +
                              _profileModel.formattedDate.replaceAll(
                                  "Dołączył/a ", ""), //TODO lepszy format daty
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Theme.of(context).textTheme.caption.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: profileModel.about != null,
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.only(left: 18.0, right: 18.0, top: 8.0),
                      child: Text(
                        profileModel.about ?? "",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
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
      onTap: () {
        setState(() => screenIndex = index);
        if (index > 2) Navigator.pop(context);
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
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              key: ValueKey(tabs[screenIndex].title),
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 8.0),
                  child: Text(
                    "Więcej aktywności",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                  ),
                ),
                DividerWidget(height: 6.0),
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Znaleziska",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(3),
                      _drawTabForIndex(4),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(5),
                      _drawTabForIndex(6),
                    ],
                  ),
                ),
                Consumer<AuthStateModel>(
                  builder: (context, authModel, _) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: <Widget>[
                        _drawTabForIndex(7),
                        authModel.loggedIn &&
                                authModel.login == _profileModel.author.login
                            ? _drawTabForIndex(8)
                            : Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
                DividerWidget(height: 6.0),
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Mikroblog",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Consumer<AuthStateModel>(
                  builder: (context, authModel, _) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: <Widget>[
                        _drawTabForIndex(9),
                        _drawTabForIndex(10),
                      ],
                    ),
                  ),
                ),
                DividerWidget(height: 6.0),
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    "Społeczność",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: <Widget>[
                      _drawTabForIndex(11),
                      _drawTabForIndex(12),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
