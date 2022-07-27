import 'package:flutter/material.dart';

class MovableItemsList extends StatefulWidget {
  const MovableItemsList({Key? key}) : super(key: key);

  @override
  State<MovableItemsList> createState() => _MovableItemsListState();
}

class _MovableItemsListState extends State<MovableItemsList> {
  double? screenHeight;
  double? screenWidth;

  List items = ['Mark', 'John', 'Greg', 'Joey'];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.1),
                child: Column(
                  children: [
                    Container(
                      height: screenHeight! * 0.4,
                      child: ReorderableListView(
                          children: List.generate(items.length,
                              (index) => movableItem(items[index], index)),
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              if (newIndex > oldIndex) {
                                newIndex -= 1;
                              }
                              final item = items.removeAt(oldIndex);
                              items.insert(newIndex, item);
                            });
                          }),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget movableItem(String name, int index) {
    return Container(
      key: ValueKey(index),
      height: screenHeight! * 0.07,
      width: screenWidth,
      margin: EdgeInsets.symmetric(vertical: screenHeight! * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // boxShadow: const [
          //   BoxShadow(
          //       offset: Offset(5, 5),
          //       blurRadius: 10.0,
          //       spreadRadius: 1.0,
          //       color: Colors.grey)
          // ],
          color: Colors.blue),
      child: Center(child: Text(name)),
    );
  }
}
