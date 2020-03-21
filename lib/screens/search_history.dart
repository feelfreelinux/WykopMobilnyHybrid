import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SearchHistoryScreen extends StatefulWidget {
  @override
  SearchHistoryScreenState createState() => SearchHistoryScreenState();
}

class SearchHistoryScreenState extends State<SearchHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<ShadowControlModel>(
      create: (context) => ShadowControlModel(scrollDelayPixels: 0),
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppbarNormalWidget(
            title: "Historia wyszukiwania",
            actions: <Widget>[
              Tooltip(
                message: "Wyczyść historię",
                child: IconButtonWidget(
                  icon: Icons.delete,
                  onTap: () {
                    Provider.of<OWMSettings>(context).searchHistory.clear();
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          body: ShadowNotificationListener(
            child: ListView.builder(
              itemCount: Provider.of<OWMSettings>(context).searchHistory.length,
              itemBuilder: (context, index) => ListTile(
                trailing: InkWell(
                  child: Icon(Icons.remove_circle),
                  onTap: () {
                    Provider.of<OWMSettings>(context)
                        .searchHistory
                        .removeAt(index);
                    setState(() {});
                  },
                ),
                title: Text(
                    Provider.of<OWMSettings>(context).searchHistory[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
