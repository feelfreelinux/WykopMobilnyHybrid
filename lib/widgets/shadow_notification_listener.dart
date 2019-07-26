/*
class ShadowNotificationListener extends StatelessWidget {
  final Widget child;

  ShadowNotificationListener({this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.globalListState.showListShadow,
      builder: (context, inputShadow) => StoreConnector<AppState, bool>(
        converter: (store) => store.state.globalListState.showListShadow,
        builder: (context, listShadow) => StoreConnector<AppState, dynamic>(
          converter: (store) => (barShadow, inputShadow) {
            if (barShadow != null) {
              store.dispatch(SetShowShadow(showShadow: barShadow));
            }

            if (inputShadow != null) {
              store.dispatch(SetShowInputShadow(showShadow: inputShadow));
            }
          },
          builder: (context, callback) =>
              NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification.metrics.pixels <
                        scrollNotification.metrics.maxScrollExtent) {
                      if (inputShadow != true && listShadow != true) {
                        callback(true, true);
                      }
                    }
                    if (scrollNotification.metrics.pixels >=
                        scrollNotification.metrics.maxScrollExtent) {
                        print( "BOTTOOOOM!!!!!");
                      if (inputShadow != false) {
                        callback(null, false);
                      }
                    }
                    if (scrollNotification.metrics.pixels <=
                        scrollNotification.metrics.minScrollExtent) {
                      if (listShadow != false) {
                        callback(false, null);
                      }
                    }
                    return;
                  },
                  child: child),
        ),
      ),
    );
  }
}
*/