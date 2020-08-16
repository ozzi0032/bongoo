import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Component11.dart';

class iPhoneXXS11Pro5 extends StatelessWidget {
  iPhoneXXS11Pro5({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdec5a2),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(78.0, 150.0, 220.0, 223.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Component11(),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(78.0, 150.0, 220.0, 223.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Component11(),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(128.0, 398.0, 120.0, 32.0),
            size: Size(375.0, 812.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Alarm Tone',
              style: TextStyle(
                fontFamily: 'Univers-Black',
                fontSize: 24,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(89.0, 473.0, 113.0, 336.0),
            size: Size(375.0, 812.0),
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Apex\n\nBulletin\n\nBy the seaside\n\nChimes\n\nCircuit\n\nConstellation\n\nCosmic\n……..',
              style: TextStyle(
                fontFamily: 'Univers-Black',
                fontSize: 18,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(54.0, 479.0, 15.0, 383.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 29,
                children: [{}, {}, {}, {}, {}, {}, {}, {}, {}].map((map) {
                  return SizedBox(
                    width: 15.0,
                    height: 16.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 15.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(56.0, 89.0, 264.0, 30.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'bongoo' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
