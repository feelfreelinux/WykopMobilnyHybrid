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
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? null
              : (MediaQuery.of(context).size.width / 2) + 28.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Powód zakopania',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ...buryReasons
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: () {
                          callback(e.reasonCode);
                          Navigator.of(context).pop();
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 10.0),
                          child: Text(
                            e.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
