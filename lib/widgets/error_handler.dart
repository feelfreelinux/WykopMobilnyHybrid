import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

typedef bool HasDataConverter();

class ErrorHandlerWidget extends StatelessWidget {
  final HasDataConverter hasData;
  final Widget child;
  ErrorHandlerWidget({this.hasData, this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
        converter: (store) => () => store.dispatch(DismissErrorAction()),
        builder: (context, dismiss) => StoreConnector<AppState, bool>(
            onWillChange: (state) {
              if (hasData()) {
                if (state) {
                  Scaffold.of(context)
                      .showSnackBar(_buildErrorSnackbar(context, dismiss));
                } else {
                  Scaffold.of(context).hideCurrentSnackBar();
                }
              }
            },
            converter: (store) =>
                store.state.errorState.exception != null &&
                !store.state.errorState.isDismissed,
            builder: (context, hasError) {
              if (hasError && !hasData()) {
                return Center(child: Text('Error się stał'));
              }
              return child;
            }));
  }

  SnackBar _buildErrorSnackbar(
      BuildContext context, VoidCallback dismissCallback) {
    return SnackBar(
      content: Text('Error się stał a dane nadal są'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: dismissCallback,
      ),
    );
  }
}
