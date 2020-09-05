import 'dart:io';
import 'dart:io';

main(List<String> args) {
  List<List<int>> board = [
    [3, 0, 6, 5, 0, 8, 4, 0, 0],
    [5, 2, 0, 0, 0, 0, 0, 0, 0],
    [0, 8, 7, 0, 0, 0, 0, 3, 1],
    [0, 0, 3, 0, 1, 0, 0, 8, 0],
    [9, 0, 0, 8, 6, 3, 0, 0, 5],
    [0, 5, 0, 0, 9, 0, 6, 0, 0],
    [1, 3, 0, 0, 0, 0, 2, 5, 0],
    [0, 0, 0, 0, 0, 0, 0, 7, 4],
    [0, 0, 5, 2, 0, 6, 3, 0, 0]
  ];
  print_board(board);
  find_empty(board);

  // print(board[0].reduce((value, element) => value + element));
}

print_noln(var obj) {
  stdout.write(obj);
}

print_board(List<List<int>> boards) {
  var boardd = [1, 2, 3, 4];
  boardd.map((board) => print(board));
  int board_length = boards.length;
  // print(board_length);
  for (int i = 0; i < boards.length; i++) {
    if (i % 3 == 0 && i != 0) {
      print('---------------------');
    }
    for (var j = 0; j < boards[0].length; j++) {
      if (j % 3 == 0 && j != 0) {
        print_noln("| ");
      }

      if (j == (boards[0].length - 1)) {
        print(boards[i][j]);
      } else {
        print_noln('${boards[i][j]} ');
      }
    }
  }
}

find_empty(List<List<int>> boards) {
  for (int i = 0; i < boards.length; i++) {
    for (int j = 0; j < boards[0].length; j++) {
      if (boards[i][j] == 0) {
        print('empty on row ${i + 1}, col ${j + 1}');
      }
    }
  }
}
