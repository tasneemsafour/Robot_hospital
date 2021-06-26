
import 'package:flutter/material.dart';

class sort_TaskScreen extends StatefulWidget {


  static String routName = '/sort_TaskScreen';
  @override
  _sort_TaskScreenState createState() => _sort_TaskScreenState();
}

class _sort_TaskScreenState extends State<sort_TaskScreen> {
  List<String> myCustomList = [
    "first element",
    "second element",
    "third element",
    "fifth element",
    "example 6",
    "example 7",
    "example 8",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mission"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: ReorderableListView(
          children: List.generate(myCustomList.length, (index) {
            return ListTile(
              key: UniqueKey(),
              title: Text(myCustomList[index]),
            );
          }),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final String newString = myCustomList.removeAt(oldIndex);
              myCustomList.insert(newIndex, newString);

            });
          },
        ),
      ),
    );
  }
}