import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class LinkWidget extends StatelessWidget {
  final int linkId;
  LinkWidget({this.linkId});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: 3.0),
        child: Material(
            color: Theme.of(context).cardColor,
            elevation: 0.0,
            child: StoreConnector<AppState, Link>(
                converter: (store) => store.state.entitiesState.links[linkId],
                builder: (context, link) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Row(children: [
                            Container(
                              width: 100,
                              height: 70,
                              child: link.preview != null
                                  ? Image(
                                      fit: BoxFit.contain,
                                      image: AdvancedNetworkImage(
                                        link.preview,
                                        useDiskCache: true,
                                      ))
                                  : Container(),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  // color: Colors.green,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(link.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        link.description,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Row(
                            children: <Widget>[
                              Image.network(
                                'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                                    link.sourceUrl,
                                height: 15,
                                width: 15,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    link.sourceUrl
                                        .replaceAll('https://', '')
                                        .replaceAll('http://', '')
                                        .split('/')[0],
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })));
  }
}
