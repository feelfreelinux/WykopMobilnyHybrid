import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:flutter/material.dart';

class EntryFooterWidget extends StatelessWidget {
  final EntryResponse entry;
  EntryFooterWidget({this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon:
                const Icon(Icons.favorite, size: 18.0, color: Colors.redAccent),
            onPressed: () {},
          ),
          Expanded(child: Container()),
          FlatButton.icon(
            icon: const Icon(Icons.comment, size: 18.0),
            label: Text(entry.commentsCount.toInt().toString()),
            onPressed: () {},
          ),
          FlatButton.icon(
            icon: const Icon(Icons.add, size: 18.0, color: Colors.greenAccent),
            label: Text(entry.voteCount.toInt().toString()),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
