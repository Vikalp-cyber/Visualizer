import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShellSort extends StatefulWidget {
  const ShellSort({Key? key}) : super(key: key);

  @override
  State<ShellSort> createState() => _ShellSortState();
}

class _ShellSortState extends State<ShellSort> {
  List<int> _numbers = [];
  int _samplesize = 500;
  _randamize() {
    for (int i = 0; i < _samplesize; ++i) {
      _numbers.add(Random().nextInt(_samplesize));
    }
    setState(() {});
  }

  _sort() async {
    for (int gap = _numbers.length ~/ 2; gap > 0; gap ~/= 2) {
      for (int i = gap; i < _numbers.length; i += 1) {
        int temp = _numbers[i];
        int j;
        for (j = i; j >= gap && _numbers[j - gap] > temp; j -= gap) _numbers[j] = _numbers[j - gap];
        _numbers[j] = temp;
        await Future.delayed(Duration(microseconds: 300));
        setState(() {
          
        });
      }
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
        title: const Text("Shell Sort"),
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
