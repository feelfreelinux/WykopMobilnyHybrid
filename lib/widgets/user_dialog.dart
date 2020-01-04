import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/model/profile_model.dart';
import 'package:owmflutter/models/author.dart';
import 'package:owmflutter/screens/profile.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UserDialogWidget extends StatefulWidget {
  final Author author;
  final bool isAuthor;

  UserDialogWidget({@required this.author, this.isAuthor = false});

  _UserDialogWidgetState createState() => _UserDialogWidgetState();
}

class _UserDialogWidgetState extends State<UserDialogWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ProfileModel(widget.author)..loadFullProfile(),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: animation,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.all(14.0),
              padding: EdgeInsets.all(18.0),
              child: Consumer<AuthStateModel>(
                builder: (context, authModel, _) => Consumer<ProfileModel>(
                  builder: (context, profileModel, _) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          AvatarWidget(
                            author: widget.author,
                            size: 52.0,
                            borderColor:
                                Theme.of(context).dialogBackgroundColor,
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.author.login,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Utils.getAuthorColor(
                                          widget.author.color, context),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    profileModel.formattedDate,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    profileModel.formatttedRankAndObservers,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: authModel.loggedIn &&
                            authModel.login != profileModel.author.login,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 18.0),
                          padding: EdgeInsets.only(
                              left: 16.0, top: 1.0, bottom: 1.0, right: 4.0),
                          decoration: BoxDecoration(
                            color: Utils.backgroundGreyOpacity(context),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Flexible(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(maxHeight: 60.0),
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      reverse: true,
                                      child: TextField(
                                        cursorRadius: Radius.circular(20.0),
                                        style: TextStyle(fontSize: 14.0),
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          border: InputBorder.none,
                                          hintText:
                                              "Notatka o użytkowniku", //TODO: get user note
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButtonWidget(
                                icon: Icons.save,
                                iconSize: 22.0,
                                iconColor: Theme.of(context).accentColor,
                                iconPadding: EdgeInsets.all(7.0),
                                padding: EdgeInsets.all(0.0),
                                onTap: () {}, //TODO: save user note action
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: authModel.loggedIn &&
                            authModel.login != profileModel.author.login,
                        child: Row(
                          children: <Widget>[
                            _button(
                              text: profileModel.isObserved
                                  ? "Obserwujesz"
                                  : "Obserwuj",
                              onTap: () => profileModel.toggleObserve(),
                              disable: profileModel.isBlocked,
                              padding: EdgeInsets.only(right: 6.0),
                            ),
                            _button(
                              text: "Napisz",
                              disable: widget.isAuthor,
                              onTap: () {
                                Navigator.of(context).push(
                                  Utils.getPageTransition(
                                    PmScreen(receiver: widget.author.login)
                                  )
                                );
                              }, //TODO: get pm screen
                              padding: EdgeInsets.only(left: 6.0),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: authModel.loggedIn &&
                            authModel.login != profileModel.author.login,
                        child: Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Row(
                            children: <Widget>[
                              _button(
                                text: profileModel.isBlocked
                                    ? "Odblokuj"
                                    : "Blokuj",
                                onTap: () => profileModel.toggleBlock(),
                                disable: profileModel.isObserved,
                                padding: EdgeInsets.only(right: 6.0),
                              ),
                              _button(
                                text: "Zgłoś",
                                onTap:
                                    () => Utils.launchURL(profileModel.violationUrl, context),
                                padding: EdgeInsets.only(left: 6.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              Utils.getPageTransition(
                                ProfileScreen(profileModel: profileModel),
                              ),
                            );
                          },
                          child: Container(
                            constraints:
                                BoxConstraints(minWidth: double.infinity),
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 12.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Pokaż profil",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    VoidCallback onTap,
    String text,
    bool disable: false,
    EdgeInsets padding,
  }) {
    return Expanded(
      child: Padding(
        padding: padding ?? EdgeInsets.all(0.0),
        child: IgnorePointer(
          ignoring: disable,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: disable ? 0.5 : 1.0,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(20),
              highlightColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                decoration: BoxDecoration(
                    color: Utils.backgroundGreyOpacity(context),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.body1.color),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
