import 'package:flutter/material.dart';

class PageButton extends StatefulWidget {
  final String name;
  final Function() onTap;
  const PageButton({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  double? screenHeight;
  double? screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: screenHeight! * 0.07,
        width: screenWidth! * 0.8,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blue),
        child: Center(child: Text(widget.name)),
      ),
    );
  }
}
