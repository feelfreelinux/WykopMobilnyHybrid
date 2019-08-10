import 'package:flutter/material.dart';
import 'package:owmflutter/models/author.dart';
import 'package:owmflutter/screens/settings/profile_edit/input_button.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

class UserDialogWidget extends StatefulWidget {
  final Author author;

  UserDialogWidget({this.author});

  _UserDialogWidgetState createState() => _UserDialogWidgetState();
}

class _UserDialogWidgetState extends State<UserDialogWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.all(18.0),
            decoration: ShapeDecoration(
                color: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      AvatarWidget(author: widget.author, size: 52.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                              "od 2 lat i 3 miesięcy",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                height: 1.2,
                                color:
                                    Theme.of(context).textTheme.caption.color,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "#2137 • 7 obserwujących",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.caption.color,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    padding: EdgeInsets.only(
                        left: 16.0, top: 1.0, bottom: 1.0, right: 4),
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
                            constraints: BoxConstraints(
                              maxHeight: 60.0,
                            ),
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                reverse: true,
                                child: TextField(
                                  cursorRadius: Radius.circular(20.0),
                                  style: TextStyle(fontSize: 14.0),
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    border: InputBorder.none,
                                    hintText: "Notatka o użytkowniku",
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
                          iconPadding: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          highlightColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 6.0),
                            decoration: BoxDecoration(
                                color: Utils.backgroundGreyOpacity(context),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Obserwuj",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).textTheme.body1.color),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            highlightColor: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 6.0),
                              decoration: BoxDecoration(
                                  color: Utils.backgroundGreyOpacity(context),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Napisz",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).textTheme.body1.color),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          highlightColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 6.0),
                            decoration: BoxDecoration(
                                color: Utils.backgroundGreyOpacity(context),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Blokuj",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).textTheme.body1.color),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      child: Container(
                        constraints: BoxConstraints(minWidth: double.infinity),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Pokaż profil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}
