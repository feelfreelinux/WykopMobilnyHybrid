import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show basename;

class SelectedImageWidget extends StatelessWidget {
  final File image;
  final VoidCallback onTap;
  final Color backgroundColor;

  SelectedImageWidget({
    @required this.image,
    @required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Container(
        margin: EdgeInsets.only(
          left: 5.0,
          top: 4.0,
          right: 4.0,
          bottom: 2.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nazwa pliku:',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      basename(image.path),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(image),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2.0,
                    right: 2.0,
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0x80000000),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}