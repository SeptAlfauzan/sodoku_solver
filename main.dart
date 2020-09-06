import 'dart:async';

import 'Sodoku.dart';

main(List<String> args) {
  List<List<int>> board = [
    [3, 0, 6, 5, 0, 8, 4, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 8, 7, 0, 0, 0, 0, 3, 1],
    [0, 0, 3, 0, 1, 0, 0, 8, 0],
    [9, 0, 0, 8, 6, 3, 0, 0, 5],
    [0, 5, 0, 0, 9, 0, 6, 0, 0],
    [1, 3, 0, 0, 0, 0, 2, 5, 0],
    [0, 0, 0, 0, 0, 0, 0, 7, 4],
    [0, 0, 5, 2, 0, 6, 3, 0, 0]
  ];
  final List<List<int>> unsolved = [
    [3, 0, 6, 5, 0, 8, 4, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 8, 7, 0, 0, 0, 0, 3, 1],
    [0, 0, 3, 0, 1, 0, 0, 8, 0],
    [9, 0, 0, 8, 6, 3, 0, 0, 5],
    [0, 5, 0, 0, 9, 0, 6, 0, 0],
    [1, 3, 0, 0, 0, 0, 2, 5, 0],
    [0, 0, 0, 0, 0, 0, 0, 7, 4],
    [0, 0, 5, 2, 0, 6, 3, 0, 0]
  ]; //create new unsolved board without reference the original one
  Sodoku sodoku = Sodoku(board);

  sodoku.solve();
  print('unsolved board');
  sodoku.print_board(unsolved);
  print('solved board');
  sodoku.print_board(board);
  // print(board[0].reduce((value, element) => value + element));
}
