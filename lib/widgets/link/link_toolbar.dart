import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

class LinkToolbarWidget extends StatelessWidget {
  final BuildContext contextmain;
  final LinkModel model;
  final AuthStateModel authStateModel;

  LinkToolbarWidget(
    this.contextmain,
    this.model,
    this.authStateModel,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: [BoxShadow(blurRadius: 30, color: Colors.black38)],
      ),
      /*margin: MediaQuery.of(context).orientation == Orientation.landscape &&
              !authStateModel.loggedIn
          ? EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width - 28) / 4,
            )
          : null,*/
      padding: EdgeInsets.fromLTRB(14.0, 16.0, 14.0, 14.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 4.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(6.0, 16.0, 6.0, 0.0),
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: RichText(
              text: TextSpan(
                text: model.author.login,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).textTheme.body1.color,
                ),
                children: model.app != null
                    ? <TextSpan>[
                        TextSpan(
                          text: " via ",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: (model.app ?? ""),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ]
                    : null,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Wrap(
            children: [
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.content_copy,
                title: "Kopiuj tekst",
                onTap: () {
                  Navigator.pop(context);
                  Utils.copyToClipboard(
                      contextmain, "${model.title}\r\n${model.description}");
                },
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.link_variant,
                title: "Kupiuj link",
                onTap: () {
                  Navigator.pop(context);
                  Utils.copyToClipboard(
                      contextmain, "https://www.wykop.pl/link/${model.id}");
                },
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.link_box_variant_outline,
                title: "Kopiuj źródło",
                onTap: () {
                  Navigator.pop(context);
                  Utils.copyToClipboard(contextmain, model.sourceUrl);
                },
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.arrow_up_circle_outline,
                title: "Wykopali (${model.voteCount})",
                onTap: () async {
                  Navigator.pop(context); //TODO lista wykopujących
                  Scaffold.of(contextmain).showSnackBar(
                      SnackBar(content: Text("Niezaimplementowane")));
                },
                disabled: model.voteCount == 0,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.arrow_down_circle_outline,
                title: "Zakopali (${model.buryCount})",
                onTap: () async {
                  Navigator.pop(context); //TODO lista zakopujących
                  Scaffold.of(contextmain).showSnackBar(
                      SnackBar(content: Text("Niezaimplementowane")));
                },
                disabled: model.buryCount == 0,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.alert_octagon_outline,
                title: "Zgłoś",
                onTap: () {
                  Navigator.pop(context);
                  Utils.launchURL(model.violationUrl, context);
                },
                disabled:
                    !authStateModel.loggedIn,
              ),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
