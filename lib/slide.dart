import 'package:flutter/material.dart';

class SlideAnimationPage extends StatefulWidget {
  const SlideAnimationPage({Key? key}) : super(key: key);

  @override
  State<SlideAnimationPage> createState() => _SlideAnimationPageState();
}

class _SlideAnimationPageState extends State<SlideAnimationPage> {
  double? boxPositionLeft;
  double? boxPositionTop;

  @override
  void initState() {
    boxPositionLeft = 50.0;
    boxPositionTop = 200;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios),
                ),
      Positioned(
        left: boxPositionLeft,
        top: boxPositionTop,
        child: GestureDetector(
          onHorizontalDragUpdate: ((details) {
            setState(() {
              boxPositionLeft = details.globalPosition.dx;
              boxPositionTop = details.globalPosition.dy;
            });
          }),
          child: Container(
            height: 50,
            width: 50,
            color: Colors.blue,
          ),
        ),
      ),
        ],
      ),
    );
  }
}
