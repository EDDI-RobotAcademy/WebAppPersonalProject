import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../api/board.dart';

class BoardListView extends StatelessWidget {
  BoardListView ({Key? key, required this.boards, required this.listTitle}) : super(key: key);

  String listTitle;
  List<Board> boards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text( listTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: boards.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 60, color: Colors.white,
                    child: _makeBoard(boards[index])
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            )
          )
        ],
      )
    );
  }
  Widget _makeBoard(Board board) {
    List<String> splitRegDate = board.regDate.toString().split('T');

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  board.title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5.0),
                Text(splitRegDate[0] + ' ' + splitRegDate[1].substring(0,5),
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  board.writer.toString(),
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}