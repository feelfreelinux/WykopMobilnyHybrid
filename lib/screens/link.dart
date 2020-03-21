import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/keys.dart';

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
      create: (context) => ShadowControlModel(),
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
                  bottomNavigationBar: model.isLoading ? Center(child: CircularProgressIndicator(),) : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        model.isResponding ? DividerWidget() : Container(),
                        model.isResponding
                            ? Container(
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "W odpowiedzi na komentarz "),
                                              TextSpan(
                                                text: model.respondingTo.login,
                                                style: TextStyle(
                                                  color: Utils.getAuthorColor(
                                                      model.respondingTo.color,
                                                      context),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () => model.cancelReply(),
                                        ),
                                      ],
                                    )),
                              )
                            : Container(),
                        InputBarWidget(
                          key: model.inputBarKey,
                        )
                      ]),
                  resizeToAvoidBottomPadding: false,
                  appBar: AppbarNormalWidget(
                    leading: IconButtonWidget(
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.of(context).pop(),
                      iconColor: Theme.of(context).accentColor,
                    ),
                    padding: EdgeInsets.only(left: 2.0, right: 6.0),
                    actions: <Widget>[
                      IconButtonWidget(
                        icon: Icons.refresh,
                        padding: EdgeInsets.all(0.0),
                        iconColor: Theme.of(context).accentColor,
                        onTap: () => refreshIndicatorKey.currentState.show(),
                      ),
                      IconButtonWidget(
                        icon: Icons.more_horiz,
                        iconColor: Theme.of(context).accentColor,
                      )
                    ],
                  ),
                  body: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).backgroundColor),
                    child: RefreshIndicator(
                      key: refreshIndicatorKey,
                      onRefresh: () {
                        return model.loadComments();
                      },
                      child: ScrollConfiguration(
                        behavior: NotSuddenJumpScrollBehavior(),
                        child: ShadowNotificationListener(
                          child: Consumer<LinkModel>(
                            builder: (context, commModel, _) => ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount: commModel.comments.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return LinkOpenedWidget();
                                }
                                return ChangeNotifierProvider<LinkCommentModel>.value(
                                  value: commModel.comments[index - 1],
                                  child: AuthorRelationBuilder(
                                    relationType: RelationType.LINK_COMMENT,
                                    builder: (context, relation) =>
                                        LinkCommentWidget(
                                            linkId: model.id, relation: relation),
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
