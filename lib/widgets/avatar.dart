import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

class AvatarWidget extends StatelessWidget {
  final Author author;
  final double size;
  final bool genderVisibility;
  final Color badge;
  final List<BoxShadow> boxShadow;
  final int resolution;
  final Color borderColor;

  AvatarWidget({
    @required this.author,
    @required this.size,
    this.genderVisibility: true,
    this.badge,
    this.boxShadow,
    this.resolution,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 1.15,
      height: size * 1.15,
      child: Stack(
        children: <Widget>[
          _drawAvatar(context),
          _drawGender(context),
        ],
      ),
    );
  }

  Widget _drawAvatar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size / 30),
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        shape: BoxShape.circle,
        color: badge ?? (borderColor ?? Theme.of(context).cardColor),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? Theme.of(context).cardColor,
            width: size / 30,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: size,
              height: size,
              padding: EdgeInsets.all(size / 4.5),
              decoration: BoxDecoration(
                color: Utils.backgroundGrey(context),
                shape: BoxShape.circle,
              ),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).iconTheme.color),
                strokeWidth: size / 18.0,
              ),
            ),
            OWMSettingListener(
              rebuildOnChange: (settings) => settings.resolutionAvatarStream,
              builder: (context, settings) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: author.avatar.length != 0
                        ? NetworkImage(
                            author.avatar.replaceAll(",q150.",
                                ",q${resolution ?? settings.resolutionAvatar}."),
                          )
                        : AssetImage('assets/avatar.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawGender(BuildContext context) {
    return Visibility(
      visible: genderVisibility && author.sex != AuthorSex.OTHER,
      child: Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: boxShadow,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Theme.of(context).cardColor,
              width: size / 15,
            ),
          ),
          child: Container(
            width: size / 4.5,
            height: size / 4.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Utils.getGenderColor(author.sex),
            ),
          ),
        ),
      ),
    );
  }
}
