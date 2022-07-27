import 'package:flutter/material.dart';
import 'package:test_project/drawer_slider.dart';
import 'package:test_project/movable_items_list.dart';
import 'package:test_project/page_button.dart';
import 'package:test_project/page_transition.dart';
import 'package:test_project/slide.dart';
import 'package:test_project/test.dart';

import 'jump_rotation.dart';

void main() {
  runApp(const MyApp());
}
// test for codemagic
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      //home: Test(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? screenHeight;
  double? screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.only(top: screenHeight! * 0.1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          PageButton(
              name: 'Jump Rotation',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JumpRotationPage()))),
          PageButton(
              name: 'Slide',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SlideAnimationPage()))),
          PageButton(
              name: 'Drawer Slide',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DrawerSlider()))),
          PageButton(
              name: 'Page transition',
              onTap: () => Navigator.of(context)
                  .push(pageAnimatedRoute(page: const JumpRotationPage()))),
          PageButton(
              name: 'Movable items list',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MovableItemsList()))),
          PageButton(
              name: 'Test',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Test()))),
        ]),
      ),
    );
  }
}
