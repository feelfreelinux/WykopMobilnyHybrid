import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/pm/pm.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/widgets/pm/uset_appbar.dart';
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
      builder: (context) => ShadowControlModel(),
      child: _SystemPadding(
        child: MediaQuery(
          data: mqDataNew,
          child: Scaffold(
            bottomNavigationBar: InputBarWidget(
              (inputData) {},
              key: OwmKeys.inputBarKey,
              iconsColor: Theme.of(context).accentColor,
              hintText: "Napisz wiadomość",
            ),
            resizeToAvoidBottomPadding: false,
            appBar: AppbarNormalWidget(
              leading: AppBarButton(
                icon: Icons.arrow_back,
                onTap: () => Navigator.of(context).pop(),
                iconSize: 28.0,
                iconColor: Theme.of(context).accentColor,
              ),
              center: UserAppBar(
                conversation: widget.conversation,
                onTap: () {
                  //TODO: Dodać przekierowanie do profilu
                },
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
