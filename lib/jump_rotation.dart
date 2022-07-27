import 'package:flutter/material.dart';
import 'dart:math';

class JumpRotationPage extends StatefulWidget {
  const JumpRotationPage({Key? key}) : super(key: key);

  @override
  State<JumpRotationPage> createState() => _JumpRotationPageState();
}

class _JumpRotationPageState extends State<JumpRotationPage>
    with TickerProviderStateMixin {
  AnimationController? rotationController;
  AnimationController? jumpController;

  Animation<double>? rotationAnimation;
  Animation<double>? jumpAnimation;
  @override
  void initState() {
    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    jumpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    rotationController!.addListener(() {
      setState(() {});
    });

    jumpController!.addListener(() {
      setState(() {});
      print(jumpAnimation!.value);
    });

    rotationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController!.reset();
      }
    });

    jumpController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        jumpController!.reverse();
      }
    });

    rotationAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
        CurvedAnimation(
            parent: rotationController!, curve: Curves.fastLinearToSlowEaseIn));

    jumpAnimation = Tween<double>(begin: 250.0, end: 0.0).animate(
        CurvedAnimation(parent: jumpController!, curve: Curves.slowMiddle));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
            child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios),
                )
              ],
            ),
            Container(
              height: jumpAnimation!.value,
              // color: Colors.blueGrey,
            ),
            GestureDetector(
              onTap: () {
                print('started');
                rotationController!.forward();
                jumpController!.forward();
              },
              child: Transform.rotate(
                angle: rotationAnimation!.value,
                child: Container(
                  height: screenWidth * 0.5,
                  width: screenWidth * 0.5,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    rotationController!.dispose();
    jumpController!.dispose();
  }
}
