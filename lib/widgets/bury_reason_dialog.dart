import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/great_dialog.dart';

class BuryReason {
  final int reasonCode;
  final String title;
  const BuryReason({this.title, this.reasonCode});
}

const buryReasons = [
  const BuryReason(title: "Duplikat", reasonCode: 1),
  const BuryReason(title: "Spam", reasonCode: 2),
  const BuryReason(title: "Informacja nieprawdziwa", reasonCode: 3),
  const BuryReason(title: "Treść nieodpowiednia", reasonCode: 4),
  const BuryReason(title: "Nie nadaje się", reasonCode: 5),
];

typedef void BuryCallback(int reason);

class BuryReasonDialog extends StatelessWidget {
  final BuryCallback callback;
  BuryReasonDialog({this.callback});
  @override
  Widget build(BuildContext context) {
    return GreatDialogWidget(
      padding: EdgeInsets.zero,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Theme.of(context).accentColor,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  'Wybierz powód zakopu',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              )),
            ),
            ...buryReasons
                .map(
                  (e) => InkWell(
                    onTap: () {
                      callback(e.reasonCode);
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Text(
                        e.title,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
                .toList(),
            Container(
              height: 8,
            )
          ]),
    );
  }
}
