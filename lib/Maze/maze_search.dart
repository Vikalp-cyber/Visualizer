import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:tuple/tuple.dart';
import 'package:visualizer/Maze/SearchAlgo.dart';
import 'package:visualizer/Maze/Search_controller_implementation.dart';

enum CellTools { wall, start, path, end }

enum SearchAlgo { dfs, bfs, a, gbs }

class MazeSearch extends StatefulWidget {
  @override
  State<MazeSearch> createState() => _MazeSearchState();
}

class _MazeSearchState extends State<MazeSearch> {
  SearchAlgo DropDownValue = SearchAlgo.dfs;
  CellTools? activatedTools;
  List<CellTools> cells = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 64; i++) {
      cells.add(CellTools.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        activatedTools = CellTools.wall;
                      });
                    },
                    icon: Icon(Icons.wallet_rounded)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        activatedTools = CellTools.path;
                      });
                    },
                    icon: Icon(Icons.circle)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        activatedTools = CellTools.start;
                      });
                    },
                    icon: Icon(Icons.play_arrow)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        activatedTools = CellTools.end;
                      });
                    },
                    icon: Icon(Icons.recommend)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        for (int i = 0; i < cells.length; i++) {
                          cells[i] = CellTools.path;
                        }
                      });
                    },
                    icon: Icon(Icons.clear_all)),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemCount: cells.length,
                itemBuilder: (context, index) {
                  return cell(
                    type: cells[index],
                    ontap: () {
                      setState(() {
                        if (activatedTools == CellTools.start ||
                            activatedTools == CellTools.end)
                          cleanOldStartingPoint(activatedTools!);
                        cells[index] = activatedTools!;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text("Deep First Search"),
                        value: SearchAlgo.dfs,
                      ),
                      DropdownMenuItem(
                        child: Text("Breadth First Search"),
                        value: SearchAlgo.bfs,
                      ),
                      DropdownMenuItem(
                        child: Text("Greedy First Search"),
                        value: SearchAlgo.gbs,
                      ),
                      DropdownMenuItem(
                        child: Text("A*"),
                        value: SearchAlgo.a,
                      ),
                    ],
                    value: DropDownValue,
                    onChanged: (SearchAlgo? value) {
                      setState(() {
                        DropDownValue = value!;
                      });
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      SearchController searchController =
                          SearchControllerImplementation();
                      switch (DropDownValue) {
                        case SearchAlgo.dfs:
                          Tuple3 dfsresults = searchController.startDFS(cells);
                          print("${dfsresults.item3}");
                          print("${dfsresults.item1}");
                          break;
                        case SearchAlgo.bfs:
                          searchController.startBFS(cells);
                          break;
                        case SearchAlgo.a:
                          searchController.startA(cells);
                          break;
                        case SearchAlgo.gbs:
                          searchController.startGBS(cells);
                          break;
                      }
                    },
                    child: Text("Search Start"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void cleanOldStartingPoint(CellTools activeTools) {
    var oldStartingPoint = cells.indexOf(activeTools);
    if (oldStartingPoint > 0) {
      cells[oldStartingPoint] = CellTools.path;
    }
  }
}

class cell extends StatelessWidget {
  VoidCallback? ontap;
  final CellTools? type;
  cell({required this.ontap, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          color: getCellColor(type!),
        ),
      ),
    );
  }
}

Color getCellColor(CellTools type) {
  switch (type) {
    case CellTools.wall:
      return Colors.black;
    case CellTools.path:
      return Colors.white;
    case CellTools.start:
      return Colors.green;
    case CellTools.end:
      return Colors.red;
  }
}
