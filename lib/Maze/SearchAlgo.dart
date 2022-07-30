import 'package:tuple/tuple.dart';

import 'maze_search.dart';



abstract class SearchController {
  Tuple3<List<String>, List<num>,num> startDFS(List<CellTools> cells);
  Tuple3<List<String>, List<num>,num> startBFS(List<CellTools> cells);
  Tuple3<List<String>, List<num>,num> startGBS(List<CellTools> cells);
  Tuple3<List<String>, List<num>,num> startA(List<CellTools> cells);
}
