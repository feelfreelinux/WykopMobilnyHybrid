import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: ChangeNotifierProvider.value(
        value: (widget.model ?? (LinkModel()..setId(widget.linkId))
          ..loadComments()),
        child: Consumer<LinkModel>(
          builder: (context, model, _) => _SystemPadding(
            child: MediaQuery(
              data: mqDataNew,
              child: Scaffold(
                bottomNavigationBar: InputBarWidget(
                  (inputData) {},
                  key: OwmKeys.inputBarKey,
                ),
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
                    onRefresh: () {
                      return model.loadComments();
                    },
                    child: ScrollConfiguration(
                      behavior: NotSuddenJumpScrollBehavior(),
                      child: ShadowNotificationListener(
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: model.comments.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return LinkOpenedWidget();
                            }
                            return ChangeNotifierProvider<LinkCommentModel>(
                              builder: (context) => LinkCommentModel()
                                ..setData(model.comments[index - 1]),
                              child: LinkCommentWidget(),
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
