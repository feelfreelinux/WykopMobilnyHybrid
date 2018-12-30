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
            converter: (store) =>
                store.state.errorState.exception != null &&
                !store.state.errorState.isDismissed,
            builder: (context, hasError) {
              if (hasError && !hasData()) {
                return Center(child: Text('Error się stał'));
              } else if (hasError) {
                print("error się stał");
                WidgetsBinding.instance.addPostFrameCallback((_) =>
                    Scaffold.of(context)
                        .showSnackBar(_buildErrorSnackbar(context, dismiss)));
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) =>
                    Scaffold.of(context)
                        .hideCurrentSnackBar());
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
