import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/spring_board_api.dart';

import '../api/board.dart';

class ProviderTest extends ChangeNotifier{
  List<Board> _boards = [];
  List<Board> get boards => _boards;
  
  loadBoards() async {
    List<Board>? boardList = await SpringBoardApi().requestSpecificBoardList("자유");
    _boards = boardList!;
    notifyListeners();
  }
}