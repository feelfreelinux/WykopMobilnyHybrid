import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class AvatarWidget extends StatelessWidget {
  final Author author;
  final double size;
  final bool genderVisibility;
  AvatarWidget(
      {@required this.author,
      @required this.size,
      this.genderVisibility: true});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).cardColor, width: size / 36)),
          child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AdvancedNetworkImage(author.avatar,
                          useDiskCache: true))))),
      _drawGender(context)
    ]);
  }

  Widget _drawGender(BuildContext context) {
    if (genderVisibility && author.sex != AuthorSex.OTHER) {
      return Positioned(
          bottom: 0,
          right: 0,
          child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).cardColor, width: size / 36)),
              child: Container(
                  width: size / 4.5,
                  height: size / 4.5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: genderColor))));
    } else {
      return Container();
    }
  }

  Color get genderColor {
    if (author.sex == AuthorSex.MALE) {
      return Colors.blue;
    } else if (author.sex == AuthorSex.FEMALE) {
      return Colors.pink;
    } else {
      return Colors.transparent;
    }
  }
}
