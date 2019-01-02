import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

typedef bool HasDataConverter();
typedef ErrorState ErrorStateConverter(Store<AppState> store);
typedef void DismissCallback(Store<AppState> store);

class ErrorHandlerWidget extends StatefulWidget {
  final HasDataConverter hasData;
  final ErrorStateConverter errorStateConverter;
  final Widget child;
  final String errorType;

  ErrorHandlerWidget(
      {@required this.hasData,
      @required this.errorType,
      @required this.child,
      @required this.errorStateConverter});
  @override
  _ErrorHandlerWidgetState createState() => _ErrorHandlerWidgetState();
}

class _ErrorHandlerWidgetState extends State<ErrorHandlerWidget> {
  bool showingDialog = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) =>
          () => (store).dispatch(DismissErrorAction(type: widget.errorType)),
      builder: (context, dismiss) =>
          StoreConnector<AppState, bool>(onWillChange: (state) {
            if (widget.hasData()) {
              if (state && !showingDialog) {
                print('error się stał');
                setState(() {
                  showingDialog = true;
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("coś się zepsuło"),
                      content: new Text("ddd"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Ok"),
                          onPressed: () {
                            _dismissDialog();
                            dismiss();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                ).then((v) => _dismissDialog());
              }
            }
          }, converter: (store) {
            var errorState = widget.errorStateConverter(store);
            return errorState.exception != null && !errorState.isDismissed;
          }, builder: (context, hasError) {
            if (hasError && !widget.hasData()) {
              return SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(child: Text('Error się stał'))));
            }
            return widget.child;
          }),
    );
  }

  _dismissDialog() {
    this.setState(() {
      this.showingDialog = false;
    });
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
