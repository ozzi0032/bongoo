import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class Component31 extends StatelessWidget {
  Component31({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 230.0, 61.0),
          size: Size(230.0, 61.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Container(
            decoration: BoxDecoration(),
          ),
        ),
      ],
    );
  }
}
