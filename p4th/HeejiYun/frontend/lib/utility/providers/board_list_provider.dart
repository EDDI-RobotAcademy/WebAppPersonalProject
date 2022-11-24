import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/spring_board_api.dart';

import '../../api/board.dart';

class BoardListProvider extends ChangeNotifier{
  List<Board> _boards = [];
  List<Board> get boards => _boards;

  loadEveryBoards() async {
    List<Board>? boardList = await SpringBoardApi().requestEveryBoardList();
    _boards = boardList!;
    notifyListeners();
  }
  
  loadFreeBoards() async {
    List<Board>? boardList = await SpringBoardApi().requestSpecificBoardList("자유");
    _boards = boardList!;
    notifyListeners();
  }

  loadAskBoards() async {
    List<Board>? boardList = await SpringBoardApi().requestSpecificBoardList("질문");
    _boards = boardList!;
    notifyListeners();
  }

  loadRecipeBoards() async {
    List<Board>? boardList = await SpringBoardApi().requestSpecificBoardList("1인분");
    _boards = boardList!;
    notifyListeners();
  }

  loadNoticeBoards() async {
    List<Board>? boardList = await SpringBoardApi().requestSpecificBoardList("공지");
    _boards = boardList!;
    notifyListeners();
  }
}