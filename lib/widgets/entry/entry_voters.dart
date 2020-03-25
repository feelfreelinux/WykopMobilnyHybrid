import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/voter.dart';
import 'package:provider/provider.dart';

class EntryVotersWidget extends StatelessWidget {
  final List<Voter> voters;

  EntryVotersWidget(this.voters);

  @override
  Widget build(BuildContext context) {
    return GreatDialogWidget(
      isScrolled: false,
      padding: EdgeInsets.zero,
      child: ChangeNotifierProvider<ShadowControlModel>(
        create: (context) => ShadowControlModel(scrollDelayPixels: 0),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 55.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: ShadowNotificationListener(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: voters.length + 1,
                          itemBuilder: (context, index) {
                            if (index == voters.length) {
                              return SizedBox(height: 18.0);
                            } else {
                              return AuthorWidget(
                                author: voters[index].author,
                                date: voters[index].date,
                                fontSize: 15.0,
                                avatarBorderColor:
                                    Theme.of(context).dialogBackgroundColor,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<ShadowControlModel>(
              builder: (context, shadowControlModel, _) => AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration:
                    Utils.appBarShadow(shadowControlModel.showTopShadow),
                child: Container(
                  color: Theme.of(context).dialogBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        child: Text(
                          "Lista plusujących",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      RoundIconButtonWidget(
                        padding: EdgeInsets.only(right: 10.0),
                        icon: Icons.close,
                        onTap: () => Navigator.pop(context),
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
}
