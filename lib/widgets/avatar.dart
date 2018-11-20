import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class AvatarWidget extends StatelessWidget {
  final Author author;
  final double size;
  final bool visibility;
  AvatarWidget({this.author, this.size, this.visibility});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 0,
        child: Stack(children: [
          Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AdvancedNetworkImage(author.avatar,
                          useDiskCache: true)))),
          Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                  opacity:
                      visibility && author.sex != AuthorSex.OTHER ? 1.0 : 0.0,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color:
                                  Colors.white, // set card color from settings
                              width: size / 36)),
                      child: Container(
                          width: size / 4.5,
                          height: size / 4.5,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: author.sex == AuthorSex.MALE
                                  ? Colors.blue
                                  : author.sex == AuthorSex.FEMALE
                                      ? Colors.pink
                                      : Colors.transparent)))))
        ]));
  }
}
