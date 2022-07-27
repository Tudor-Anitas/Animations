import 'dart:math';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: List.generate(10, (index) => ItemPanel())),
      )),
    );
  }
}

class ItemPanel extends StatefulWidget {
  const ItemPanel({Key? key}) : super(key: key);

  @override
  State<ItemPanel> createState() => _ItemPanelState();
}

class _ItemPanelState extends State<ItemPanel> {
  bool isExpanded = false;
  double turns = 2*pi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 350,
          color: Colors.blue,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('+2.00ø'),
            AnimatedRotation(
              duration: const Duration(milliseconds: 150),
              turns: isExpanded ? 0.5 : 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                  
                },
                child: const Icon(Icons.arrow_downward),
              ),
            ),
            const Text('+2.00¢'),
          ]),
        ),
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? 400 : 0,
          width: 350,
          color: Colors.amber,
        )
      ],
    );
  }
}
