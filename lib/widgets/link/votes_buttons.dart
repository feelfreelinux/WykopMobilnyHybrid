import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class VotesButtonsWidget extends StatelessWidget {
  final VoidCallback onTapUpVote;
  final VoidCallback onTapDownVote;
  final bool showButtonsState;

  VotesButtonsWidget({
    @required this.onTapUpVote,
    @required this.onTapDownVote,
    @required this.showButtonsState,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      right: 44.0,
      child: IgnorePointer(
        ignoring: !showButtonsState,
        child: AnimatedOpacity(
          opacity: showButtonsState ? 1 : 0,
          curve: Curves.linearToEaseOut,
          duration: Duration(milliseconds: 300),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.grey[800],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.0,
                      offset: Offset(0.0, 1.0),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 2.0,
                ),
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: <Widget>[
                    _button(context, true, onTapUpVote),
                    _button(context, false, onTapDownVote),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(BuildContext context, bool upVote, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Utils.backgroundGreyOpacity(context),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(upVote ? Icons.thumb_up : Icons.thumb_down, size: 18),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      upVote ? "Wykop" : "Zakop",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
