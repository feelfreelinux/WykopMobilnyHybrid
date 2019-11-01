import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/author.dart';
import 'package:owmflutter/models/voter.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  final EntryModel model;
  final int entryId;

  EntryScreen({Key key, this.model, this.entryId}) : super(key: key);

  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen>
    with SingleTickerProviderStateMixin {
  EntryModel _entryModel;
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  @override
  void initState() {
    _entryModel = (widget.model ?? (EntryModel()..setId(widget.entryId))
        ..updateEntry()
        ..loadUpVoters());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<EntryModel>.value(
      value: _entryModel,
      child: ChangeNotifierProvider<ShadowControlModel>(
        builder: (context) => ShadowControlModel(),
        child: Consumer<EntryModel>(
          builder: (context, model, _) =>
              ChangeNotifierProvider<InputModel>.value(
            value: model,
            child: model.isLoading && model.body == null
                ? Center(child: CircularProgressIndicator())
                : _SystemPadding(
                    child: MediaQuery(
                      data: mqDataNew,
                      child: Scaffold(
                        backgroundColor: Theme.of(context).backgroundColor,
                        bottomNavigationBar: InputBarWidget(
                          key: model.inputBarKey,
                        ),
                        resizeToAvoidBottomPadding: false,
                        appBar: AppbarNormalWidget(
                          leading: IconButtonWidget(
                            icon: Icons.arrow_back,
                            onTap: () => Navigator.of(context).pop(),
                            iconColor: Theme.of(context).accentColor,
                          ),
                          center: Consumer<ShadowControlModel>(
                            builder: (context, shadowControlModel, _) =>
                                AnimatedOpacity(
                              opacity:
                                  shadowControlModel.showTopShadow ? 0.0 : 1.0,
                              duration: Duration(milliseconds: 300),
                              child: AuthorWidget(
                                author: Author.fromAuthState(
                                  username: model.author.login,
                                  avatarUrl: model.author.avatar,
                                  color: model.author.color,
                                  sex: model.author.sex,
                                ),
                                date: model.date,
                                fontSize: 16.0,
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 2.0, right: 6.0),
                          actions: <Widget>[
                            IconButtonWidget(
                              icon: Icons.refresh,
                              iconColor: Theme.of(context).accentColor,
                              padding: EdgeInsets.all(0.0),
                              onTap: () => refreshIndicatorKey.currentState.show(),
                            ),
                            IconButtonWidget(
                              icon: Icons.more_horiz,
                              iconColor: Theme.of(context).accentColor,
                              onTap: () {},
                            )
                          ],
                        ),
                        body: RefreshIndicator(
                          key: refreshIndicatorKey,
                          onRefresh: () async {
                            await model.updateEntry();
                            await model.loadUpVoters();
                          },
                          child: ScrollConfiguration(
                            behavior: NotSuddenJumpScrollBehavior(),
                            child: InfiniteList(
                              persistentHeaderBuilder: (context) => EntryOpenWidget(),
                              itemCount: model.comments.length,
                              itemBuilder: (context, index) =>
                                  ChangeNotifierProvider<
                                      EntryCommentModel>.value(
                                value: model.comments[index],
                                child: AuthorRelationBuilder(
                                  relationType: RelationType.ENTRY_COMMENTS,
                                  builder: (context, relation) =>
                                      EntryCommentWidget(
                                    entryId: model.id,
                                    relation: relation,
                                  ),
                                ),
                              ),
                              loadData: () async {
                                return;
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
