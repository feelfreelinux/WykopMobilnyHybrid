import 'package:flutter/material.dart';

class ActionsDialogItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ActionsDialogItem({
    this.icon,
    this.title,
    this.onTap,
  });
}

class ActionsDialog {
  static void showActionsDialog(
      BuildContext context, List<ActionsDialogItem> actions) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return new Column(
          mainAxisSize: MainAxisSize.min,
          children: actions
              .map(
                (action) => ListTile(
                  leading: new Icon(action.icon),
                  title: action.title != null ? new Text(action.title) : null,
                  onTap: () {
                    action.onTap();
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
