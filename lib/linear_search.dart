import 'dart:math';

import 'package:flutter/material.dart';

class LinearSearch extends StatefulWidget {
  const LinearSearch({Key? key}) : super(key: key);

  @override
  State<LinearSearch> createState() => _LinearSearchState();
}

class _LinearSearchState extends State<LinearSearch> {
  List<int> _numbers = [];
  int _samplesize = 20;
  _randamize() {
    for (int i = 0; i < _samplesize; ++i) {
      _numbers.add(Random().nextInt(_samplesize));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linear Search"),
        centerTitle: true,
      ),
      body: Container(
          child: Row(
        children: _numbers.map((int number) {
          return Container();
        }).toList(),
      )),
    );
  }
}
