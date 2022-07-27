import 'dart:math';

import 'package:flutter/material.dart';

class DrawerSlider extends StatefulWidget {
  const DrawerSlider({Key? key}) : super(key: key);

  @override
  State<DrawerSlider> createState() => _DrawerSliderState();
}

class _DrawerSliderState extends State<DrawerSlider> {
  double? screenHeight;
  double? screenWidth;
  double menuHeightMultiplier = 1.0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.direction <= 0 &&
                details.delta.direction >= (-pi) / 2) {
              setState(() {
                menuHeightMultiplier += details.delta.distance / 100;
                if (menuHeightMultiplier > 1.5) {
                  menuHeightMultiplier = 4.0;
                }
              });
            } else {
              if (menuHeightMultiplier > 1.0) {
                setState(() {
                  menuHeightMultiplier -= details.delta.distance / 100;
                  if (menuHeightMultiplier < 3.5) {
                    menuHeightMultiplier = 1.0;
                  }
                });
              }
            }
          },
          onVerticalDragEnd: (details) {
            if (menuHeightMultiplier > 1.0 && menuHeightMultiplier < 1.5) {
              setState(() {
                menuHeightMultiplier = 1.0;
              });
            }
            if (menuHeightMultiplier > 3.5 && menuHeightMultiplier < 4.0) {
              setState(() {
                menuHeightMultiplier = 4.0;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 700),
            curve: Curves.fastLinearToSlowEaseIn,
            height: screenHeight! * 0.2 * menuHeightMultiplier,
            width: screenWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.blue),
          ),
        )
      ]),
    );
  }
}
