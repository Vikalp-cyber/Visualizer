import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InsertionSort extends StatefulWidget {
  const InsertionSort({Key? key}) : super(key: key);

  @override
  State<InsertionSort> createState() => _InsertionSortState();
}

class _InsertionSortState extends State<InsertionSort> {
  List<int> _numbers = [];
  int _samplesize = 500;
  _randamize() {
    for (int i = 0; i < _samplesize; ++i) {
      _numbers.add(Random().nextInt(_samplesize));
    }
    setState(() {});
  }

  _sort() async {
    for (int i = 1; i < _numbers.length; i++) {
      int temp = _numbers[i];
      int j = i - 1;
      while (j >= 0 && temp < _numbers[j]) {
        _numbers[j + 1] = _numbers[j];
        --j;
        await Future.delayed(Duration(microseconds: 300));
        setState(() {});
      }
      _numbers[j + 1] = temp;
      await Future.delayed(Duration(microseconds: 300));
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _randamize();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insertion Sort"),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
            children: _numbers.map((int number) {
          counter++;
          return CustomPaint(
            painter: Barpainter(
              width: 2.0,
              value: number,
              index: counter,
            ),
          );
        }).toList()),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: _randamize,
              child: Text(
                "Randamize",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: _sort,
              child: Text(
                "Sort",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Barpainter extends CustomPainter {
  final double? width;
  final int? value;
  final int? index;
  Barpainter({this.index, this.value, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(index! * width!, 0),
        Offset(index! * width!, value!.ceilToDouble()), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
