import 'dart:io';

class Sodoku {
  List<List<int>> _board;
  DateTime _start = DateTime.now();
  Sodoku(this._board);
  print_noln(var obj) {
    stdout.write(obj); //print without add new line at the end of sentencez
  }

  print_board(List<List<int>> board) {
    // print(board_length);
    for (int i = 0; i < board.length; i++) {
      if (i % 3 == 0 && i != 0) {
        //add separator line when i (row) mod by 3 equals 0
        print('---------------------');
      }
      for (var j = 0; j < board[0].length; j++) {
        if (j % 3 == 0 && j != 0) {
          print_noln("| ");
        }
        if (j == (board[0].length - 1)) {
          //if j reach last index of board[0]
          print(board[i][j]); //print value with new line
        } else {
          print_noln('${board[i][j]} '); //print value without new line
        }
      }
    }
  }

  get board => _board;

  solve() {
    var _empty = find_empty();
    //if no empty value (0), sodoku board already soved
    if (_empty == null) {
      var now = DateTime.now();
      var finished = now.millisecond - _start.millisecond;
      print('');
      print('SOLVED ON, $finished millisec!');
      print('');
      return true;
    }
    ;

    var row = _empty[0];
    var col = _empty[1];

    for (var i = 1; i < 10; i++) {
      if (valid(i, [row, col])) {
        _board[row][col] = i;
        print('');
        print_board(_board);
        //if solution (i) is not valid
        if (solve()) return true;
        _board[row][col] = 0; //set back to empty value
      }
    }

    return false;
  }

  find_empty() {
    for (int i = 0; i < _board.length; i++) {
      //loop through row
      for (int j = 0; j < _board[0].length; j++) {
        //loop through column
        if (_board[i][j] == 0) {
          // index value is zero
          // print('empty on row ${i + 1}, col ${j + 1}');

          return [i, j];
        }
      }
    }

    return null;
  }

  valid(int number, List<int> position) {
    int row = position[0];
    int column = position[1];
    for (var i = 0; i < _board[0].length; i++) {
      //check row
      if (_board[row][i] == number && column != i) {
        return false;
      }
      //check column
      if (_board[i][column] == number && row != i) {
        return false;
      }
    }
    int box_x = row ~/ 3;
    int box_y = column ~/ 3;
    int box_x_dimension = box_x * 3;
    int box_y_dimension = box_y * 3;
    //check 3 x 3 box
    for (var i = box_x_dimension; i < box_x_dimension + 3; i++) {
      for (var j = box_y_dimension; j < box_y_dimension + 3; j++) {
        //print 3 x 3 box
        if (_board[i][j] == number && position != [i, j]) {
          return false;
        }
        // print_noln('${_board[i][j]} ');
      }
      // print('');
    }
//everything is fine
    return true;
  }
}
