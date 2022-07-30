import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:visualizer/bubble_sort.dart';
import 'package:visualizer/insertion_sort.dart';
import 'package:visualizer/shell_sort.dart';
import 'package:visualizer/selection_sort.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Visualizer",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Text(
              "Select the Algorithms : ",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BubbleSort()));
              },
              child: Text("Bubble Sort"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InsertionSort()));
              },
              child: Text("Insertion Sort"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectionSort()));
              },
              child: Text("Selection Sort"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShellSort()));
              },
              child: Text("Shell Sort"),
            ),
          ),
        ],
      ),
    );
  }
}
