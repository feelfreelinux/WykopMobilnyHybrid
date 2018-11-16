import 'package:flutter/material.dart';

class AppbarUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  width: 1,
                  height: 1,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png")))),
            )),
    );
  }
}