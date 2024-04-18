import 'dart:io';

class TicTacToe{
  List<String> board = List.filled(9,"");

  void printBoard(){
    print('${board[0]}| ${board[1]}| ${board}[2]');
    print('-------');
    print('${board[3]}|${board[4]}|$board[5]');
    print('------');
    print('${board[6]}|${board[7]}|${board[8]}');
    print('-------');
  }
  bool checkWinner(String player) { 
    return(board[0]==player&&board[1]==player&&board[2]==player) ||
      (board[3] == player&&board[4] == player&& board[5] == player) ||
      (board[6] == player&&board[7] == player && board[8] == player) ||
      (board[0] == player&& board[3] == player&& board[6] == player) ||
      (board[1] == player&& board[4] == player&& board[7] == player) ||
      (board[2] == player&& board[5] == player&&board[8] == player) ||
      (board[0] == player&& board[4] == player&& board[8] == player) ||
      (board[2] == player&& board[4] == player&& board[6] == player);
     }
     bool isBoardFull() {
      return !board.contains('');
     }
     void play() {
      print('welcome to Tic Tac Toe');
      printBoard();

      var currentPlayer = 'X';
      var gameOver = false;

      while (!gameOver) {
        print('\n$currentPlayer\'s turn. Enter position(1-9):');

        var inputString = stdin.readLineSync();

          if (inputString!= null) {
            var input = int.tryParse(inputString);
            if (input!=null && input >= 1 && input <=9) {
              board[input-1] = currentPlayer;
              printBoard();
            }
            if (checkWinner(currentPlayer)){
              print('$currentPlayer wins');
              gameOver=true;
            }
            if(isBoardFull()){
              print('its a Draw!');
              gameOver=true;
            }
            currentPlayer= currentPlayer =='X'?'O':'X';
            }else{
              print('Invalid input! Please enter a number between1-9');
            }
          }
     }
}
void main(){
  var game = TicTacToe();
  game.play();
}