import 'package:flutter/material.dart';
import 'package:visualizer/Maze/maze_search.dart';
import 'package:visualizer/linear_search.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sorting Algorithms ',
      home: LinearSearch(),
    );
  }
}
