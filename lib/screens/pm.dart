import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/pm/pm.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/keys.dart';
import 'package:provider/provider.dart';

class PmScreen extends StatefulWidget {
  final String receiver;
  PmScreen({@required this.receiver});
  _PmScreenState createState() => _PmScreenState();
}

class _PmScreenState extends State<PmScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShadowControlModel>(
          builder: (context) =>
              ShadowControlModel(reverse: true, scrollDelayPixels: 0),
        ),
        ChangeNotifierProvider<PrivateMessagesModel>(
          builder: (context) => PrivateMessagesModel(receiverNickname: widget.receiver)..loadMessages(),
        ),
      ],
      child: _SystemPadding(
        child: MediaQuery(
          data: mqDataNew,
          child: Consumer<PrivateMessagesModel>(
            builder: (context, pmModel, _) =>
                ChangeNotifierProvider<InputModel>.value(
              value: pmModel,
              child: Scaffold(
                bottomNavigationBar: InputBarWidget(
                  (_) {},
                  key: pmModel.inputBarKey,
                  hintText: "Napisz wiadomość",
                ),
                resizeToAvoidBottomPadding: false,
                appBar: AppbarNormalWidget(
                  leading: IconButtonWidget(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.of(context).pop(),
                    iconColor: Theme.of(context).accentColor,
                  ),
                  center: pmModel.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : AuthorWidget(
                          author: pmModel.receiver,
                          date: pmModel.lastUpdate,
                          fontSize: 16,
                          padding: EdgeInsets.all(0),
                          isAuthor: true,
                        ),
                ),
                body: pmModel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : PmWidget(messages: pmModel.messages),
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
        duration: const Duration(milliseconds: 150),
        child: child);
  }
}
