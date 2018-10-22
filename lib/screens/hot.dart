import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';

class HotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mikroblog'),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(OwmGlyphs.ic_tag),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(OwmGlyphs.ic_mail),
              onPressed: () {},
            ),
            // action button
          ],
        ),
        body: Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).backgroundColor),
            child: StoreConnector<AppState, MikroblogState>(
                converter: (store) => store.state.mikroblogState,
                onInit: (store) {
                  store.dispatch(LoadHotAction());
                },
                builder: (context, state) {
                  if (state.isLoading && state.page == 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return StoreConnector<AppState, VoidCallback>(
                      converter: (store) {
                    return () => store.dispatch(LoadHotAction());
                  }, builder: (context, callback) {
                    return InfiniteList(
                        isLoading: state.isLoading,
                        loadData: callback,
                        itemCount: state.entries.length,
                        itemBuilder: (context, index) {
                          return EntryWidget(entry: state.entries[index]);
                        });
                  });
                })),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(OwmGlyphs.ic_navi_links),
              title: new Text('Znaleziska'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(OwmGlyphs.ic_navi_my_wykop),
              title: new Text('Mój Wykop'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(OwmGlyphs.ic_navi_mirkoblog),
              title: new Text('Mikroblog'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(OwmGlyphs.ic_navi_favourite),
              title: new Text('Ulubione'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(OwmGlyphs.ic_navi_messages),
              title: new Text('Wiadomości'),
            ),
          ],
        ));
  }
}
