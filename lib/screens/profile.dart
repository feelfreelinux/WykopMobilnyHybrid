import 'package:flutter/material.dart';
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

class ProfileScreenState extends State<ProfileScreen> {
  String list = "Akcje";
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
            appBar: AppbarNormalWidget(
              title: widget.profileModel.author.login,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                  tooltip: "Odśwież",
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.edit),
              onPressed: () {},
            ),
            body: _drawBody(),
          ),
        ),
      ),
    );
  }

  _drawBody() {
    if (list == "Akcje") {
      return EntriesLinksList(
        header: _drawHeader(),
        builder: (context) => EntryLinkListmodel(
          loadNewEntryLinks: (page) =>
              api.profiles.getActions(widget.profileModel.author.login),
        ),
      );
    }
  }

  Widget _drawHeader() {
    return Column(
      children: <Widget>[
        widget.profileModel.backgroundUrl != null
            ? Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    child: Image(
                      image: AdvancedNetworkImage(
                          widget.profileModel.backgroundUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : Container(),
        Container(
          padding: EdgeInsets.only(left: 18.0, right: 4.0),
          child: Row(
            children: <Widget>[
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: <String>['Akcje'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                  value: list,
                  onChanged: (value) {
                    setState(() {
                      list = value;
                    });
                  },
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
        ),
        DividerWidget(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
        ),
      ],
    );
  }
}
