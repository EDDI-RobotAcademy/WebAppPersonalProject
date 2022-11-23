import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_style/api/board_spring_api.dart';

class BoardModifyForm extends StatefulWidget {
  BoardModifyForm({Key? key, required this.formKey, required this.titleController, required this.contentController, required this.boardNo}) : super(key: key);

  GlobalKey<FormState> formKey;
  TextEditingController titleController;
  TextEditingController contentController;
  int boardNo;

  @override
  State<BoardModifyForm> createState() => _BoardModifyFormState();
}

class _BoardModifyFormState extends State<BoardModifyForm> {

  var boardData;
  RequestBoard? board;

  void getBoard() {
    boardData.then((value) {
      setState(() {
        board = value;
      });
    });
  }

  @override
  void initState() {
    boardData = BoardSpringApi().requestBoard(widget.boardNo);
    getBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              validator: (text) {
                if(text!.isEmpty) {
                  return '제목을 입력해주세요.';
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.titleController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                isDense: true,
                labelText: '제목',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: '제목을 입력하세요.',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: TextFormField(
              validator: (text) {
                if(text!.isEmpty) {
                  return '내용을 입력해주세요.';
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.contentController,
              maxLines: 10,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                isDense: true,
                labelText: '내용',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: '내용을 입력하세요.',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
