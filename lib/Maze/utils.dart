import 'dart:core';
// import 'dart:html';

import 'package:visualizer/Maze/maze_search.dart';

class Node {
  final String? actions;
  final num? state;
  final Node? parent;

  Node(this.state,{this.actions, this.parent });
}

class StackFrontier {
  List<Node>? _frontier = [];

  void add(Node node) {
    _frontier?.add(node);
  }

  bool containsState(state) {
    Node? node = _frontier?.firstWhere((node) => node.state == state, orElse: ()=>null!);
    return node != null;
  }

  bool? empty() {
    return _frontier?.isEmpty;
  }

  Node? remove() {
    if (empty()!) {
      throw Exception("Empty Frontier");
    } else {
      Node node = _frontier!.removeLast();
    }
  }
}

class QueueFrontier extends StackFrontier {
  @override
  Node? remove() {
    if (empty()!) {
      throw Exception("Empty Frontier");
    } else {
      return _frontier?.removeAt(0);
    }
  }
}
