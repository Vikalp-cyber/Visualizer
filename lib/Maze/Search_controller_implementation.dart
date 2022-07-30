import 'package:tuple/tuple.dart';
import 'package:visualizer/Maze/SearchAlgo.dart';
import 'package:visualizer/Maze/maze_search.dart';

import 'utils.dart';

class SearchControllerImplementation extends SearchController {
  @override
  Tuple3<List<String>, List<num>, num> startA(List<CellTools> cells) {
    // TODO: implement startA
    throw UnimplementedError();
  }

  @override
  Tuple3<List<String>, List<num>, num> startBFS(List<CellTools> cells) {
    // TODO: implement startBFS
    throw UnimplementedError();
  }

  @override
  Tuple3<List<String>, List<num>, num> startDFS(List<CellTools> cells) {
    num start = cells.indexOf(CellTools.start);
    num end = cells.indexOf(CellTools.end);
    if (start == -1 || end == -1) {
      throw ArgumentError("It needs Start and end positions");
    }
    List<num> allWalls = [];
    List<num> allPaths = [];

    cells.asMap().forEach((index, element) {
      switch (element) {
        case CellTools.wall:
          allWalls.add(index);
          break;
        case CellTools.path:
          allPaths.add(index);
          break;
        case CellTools.start:
        case CellTools.end:
          break;
      }
    });

    num explored_tiles = 0;
    Node startNode = Node(start);
    StackFrontier frontier = StackFrontier();
    frontier.add(startNode);

    Set<num> explored = {};
    while (true) {
      if (frontier.empty()!) {
        throw Exception("There is no Solution");
      }
      Node node = frontier.remove()!;
      explored_tiles + 1;
      if (node.state == end) {
        List<String> actions = [];
        List<num> cells = [];
        while (node.parent != null) {
          actions.add(node.actions!);
          cells.add(node.state!);
          node = node.parent!;
        }
        actions.reversed;
        cells.reversed;
        return Tuple3<List<String>, List<num>, num>(
            actions, cells, explored_tiles);
      }
      explored.add(node.state!);

      for (var entry in _neighbour(cells, node.state!).entries) {
        if (!explored.contains(entry.value) &&
            !frontier.containsState(entry.value)) {
          var childnode = Node(entry.value, actions: entry.key, parent: node);
          frontier.add(childnode);
        }
      }
      _neighbour(cells, node.state!).forEach((key, state) {});
    }
  }

  @override
  Tuple3<List<String>, List<num>, num> startGBS(List<CellTools> cells) {
    // TODO: implement startGBS
    throw UnimplementedError();
  }

  Map<String, num> _neighbour(List<CellTools> cells, num state) {
    Map<String, num> results = {
      "up": state - 8,
      "down": state + 8,
      "left": state - 1,
      "right": state + 1,
    };
    results.removeWhere((key, value) {
      return (value < 0 ||
          value > 63 ||
          cells[value.toInt()] != CellTools.wall);
    });
    return results;
  }
}
