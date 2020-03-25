import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onTap;

  ShareButton({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.center,
        child: Icon(
          CommunityMaterialIcons.share_variant,
          size: 22.0,
          color: Theme.of(context).textTheme.caption.color,
        ),
      ),
    );
  }
}
