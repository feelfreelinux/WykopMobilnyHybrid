import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:share/share.dart';

class LinkScreen extends StatefulWidget {
  final LinkModel model;
  final int linkId;

  LinkScreen({this.model, this.linkId, Key key}) : super(key: key);

  _LinkScreenState createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen>
    with SingleTickerProviderStateMixin {
  LinkModel _linkModel;
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  @override
  void initState() {
    _linkModel = (widget.model ?? (LinkModel()..setId(widget.linkId))
      ..updateLink()
      ..loadComments());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<ShadowControlModel>(
      create: (context) => ShadowControlModel(scrollDelayPixels: 130),
      child: ChangeNotifierProvider.value(
        value: _linkModel,
        child: Consumer<LinkModel>(
          builder: (context, model, _) =>
              ChangeNotifierProvider<InputModel>.value(
            value: model,
            child: _SystemPadding(
              child: MediaQuery(
                data: mqDataNew,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  bottomNavigationBar: model.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : InputBarWidget(
                          key: model.inputBarKey,
                          isLinkScreen: true,
                          child: model.isResponding
                              ? Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 4.0, 10.0, 0.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .body1
                                                  .color,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "Odpowiedź na komentarz ",
                                              ),
                                              TextSpan(
                                                text: model.respondingTo.login,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Utils.getAuthorColor(
                                                    model.respondingTo.color,
                                                    context,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      RoundIconButtonWidget(
                                        padding: EdgeInsets.zero,
                                        iconPadding: EdgeInsets.all(4.0),
                                        icon: Icons.close,
                                        onTap: () => model.cancelReply(),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ),
                  resizeToAvoidBottomPadding: false,
                  appBar: AppbarNormalWidget(
                    animatedBackground: true,
                    leading: RoundIconButtonWidget(
                      icon: Icons.keyboard_backspace,
                      iconSize: 26.0,
                      onTap: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.fromLTRB(8.0, 0.0, 16.0, 0.0),
                      iconPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    ),
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    actions: <Widget>[
                      RoundIconButtonWidget(
                        icon: model.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        iconColor: model.isFavorite ? Colors.red : null,
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        iconPadding: EdgeInsets.fromLTRB(6.0, 7.0, 6.0, 5.0),
                        onTap: () => model.favoriteToggle(),
                      ),
                      RoundIconButtonWidget(
                        iconSize: 22.0,
                        icon: Icons.share,
                        padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                        iconPadding: EdgeInsets.fromLTRB(6.0, 7.0, 8.0, 7.0),
                        onTap: () => Share.share(model.title +
                            "\r\nhttps://www.wykop.pl/link/" +
                            model.id.toString()),
                      ),
                      RoundIconButtonWidget(
                        iconSize: 26.0,
                        icon: Icons.refresh,
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        iconPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        onTap: () => refreshIndicatorKey.currentState.show(),
                      )
                    ],
                  ),
                  body: Container(
                    color: Theme.of(context).backgroundColor,
                    child: RefreshIndicator(
                      displacement: 100.0,
                      key: refreshIndicatorKey,
                      onRefresh: () => model.loadComments(),
                      child: ScrollConfiguration(
                        behavior: NotSuddenJumpScrollBehavior(),
                        child: ShadowNotificationListener(
                          child: Consumer<LinkModel>(
                            builder: (context, commModel, _) =>
                                ListView.builder(
                              padding: EdgeInsets.all(0),
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount: commModel.comments.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0)
                                  return Column(
                                    children: <Widget>[
                                      LinkOpenedWidget(),
                                      NoCommentsWidget(
                                          model.comments.length == 0)
                                    ],
                                  );
                                return ChangeNotifierProvider<
                                    LinkCommentModel>.value(
                                  value: commModel.comments[index - 1],
                                  child: AuthorRelationBuilder(
                                    relationType: RelationType.LINK_COMMENT,
                                    builder: (context, relation) =>
                                        LinkCommentWidget(
                                      linkId: model.id,
                                      relation: relation,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
      padding: mediaQuery.viewInsets,
      duration: Duration(milliseconds: 150),
      child: child,
    );
  }
}
