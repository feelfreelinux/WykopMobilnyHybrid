import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/pm/pm.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/keys.dart';
import 'package:provider/provider.dart';

class PmScreen extends StatefulWidget {
  final Conversation conversation;

  PmScreen({this.conversation});

  _PmScreenState createState() => _PmScreenState();
}

class _PmScreenState extends State<PmScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) =>
          ShadowControlModel(reverse: true, scrollDelayPixels: 0),
      child: _SystemPadding(
        child: MediaQuery(
          data: mqDataNew,
          child: Scaffold(
            bottomNavigationBar: InputBarWidget(
              (inputData) {},
              key: OwmKeys.inputBarKey,
              hintText: "Napisz wiadomość",
            ),
            resizeToAvoidBottomPadding: false,
            appBar: AppbarNormalWidget(
              leading: IconButtonWidget(
                icon: Icons.arrow_back,
                onTap: () => Navigator.of(context).pop(),
                iconColor: Theme.of(context).accentColor,
              ),
              center: AuthorWidget(
                author: Author.fromAuthState(
                  username: widget.conversation.author.login,
                  avatarUrl: widget.conversation.author.avatar,
                  color: 5,
                  sex: widget.conversation.author.sex,
                ),
                date: widget.conversation.lastUpdate,
                fontSize: 16,
                padding: EdgeInsets.all(0),
              ),
            ),
            body: FutureBuilder<List<PmMessage>>(
              future: api.pm.getMessages(widget.conversation.author.login),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  debugPrint(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return PmWidget(snapshot: snapshot);
                }
                return Center(child: CircularProgressIndicator());
              },
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
        duration: const Duration(milliseconds: 150),
        child: child);
  }
}
