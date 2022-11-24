import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/spring_board_api.dart';
import 'package:frontend/components/custom_app_bar.dart';
import 'package:frontend/components/custom_drawer.dart';
import 'package:frontend/components/text_form_fields/text_form_field_for_board.dart';

import '../../api/board.dart';
import '../../pages/boards/board_detail_page.dart';
import '../../utility/size.dart';
import '../custom_alert_dialog.dart';

class BoardModifyForm extends StatefulWidget {
  BoardModifyForm({Key? key, required this.board}) : super(key: key);
  Board board;

  @override
  State<BoardModifyForm> createState() => _BoardModifyFormState();
}

class _BoardModifyFormState extends State<BoardModifyForm> {

  late TextEditingController titleController = TextEditingController(text: widget.board.title);
  late TextEditingController contentController = TextEditingController(text: widget.board.content);

  late int boardNo;
  late String category;
  late String title;
  late String writer;
  late String content;

  late Board responseBoard;

  @override
  void initState() {
    titleController.addListener(() {
      title = titleController.text;
    });
    contentController.addListener(() {
      content = contentController.text;
    });
    writer = widget.board.writer;
    boardNo = widget.board.boardNo;
    category = widget.board.categoryName;

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: CommonAppBar(title: "게시물 수정하기"),
      drawer: CustomDrawer(),
      body: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormFieldForBoard(use:"제목", maxLines:1, controller: titleController),
                  SizedBox(height: small_gap,),
                  TextFormFieldForBoard(use:"내용", maxLines:20, controller: contentController),
                  SizedBox(height: small_gap,),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        responseBoard = await SpringBoardApi().requestBoardModify(BoardModifyRequest(boardNo, title, content));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BoardDetailPage(board: responseBoard),
                          ),
                        );
                      } else {
                        showResultDialog(context, "게시물 등록 실패", "제목과 내용을 작성해주세요!");
                      }
                    },
                    child: Text("게시글 수정하기")
                ),
                  SizedBox(height: small_gap,),
                  TextButton(
                      onPressed: () async {
                        await SpringBoardApi().requestBoardDelete(boardNo);
                        moveToList(category);
                      },
                      child: Text("게시글 삭제하기")
                  )],
              )
            )
          )
      );
  }

  void showResultDialog(BuildContext context, String title, String alertMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(title: title, alertMsg: alertMsg)
    );
  }

  void moveToList(String category) {
    if(category == "자유") {
      Navigator.pushNamed(context, "/board-list-free");
    } else if(category == "질문") {
      Navigator.pushNamed(context, "/board-list-ask");
    } else if(category == "1인분") {
      Navigator.pushNamed(context, "/board-list-recipe");
    }
  }
}