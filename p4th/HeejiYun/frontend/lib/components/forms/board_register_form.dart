import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/spring_board_api.dart';
import 'package:frontend/components/buttons/category_drop-down_btn.dart';
import 'package:frontend/components/custom_app_bar.dart';
import 'package:frontend/components/custom_drawer.dart';
import 'package:frontend/components/text_form_fields/text_form_field_for_board.dart';
import 'package:frontend/utility/category_provider.dart';
import 'package:provider/provider.dart';

import '../../utility/size.dart';
import '../custom_alert_dialog.dart';

class BoardRegisterForm extends StatefulWidget {
  BoardRegisterForm({Key? key}) : super(key: key);

  @override
  State<BoardRegisterForm> createState() => _BoardRegisterFormState();
}

class _BoardRegisterFormState extends State<BoardRegisterForm> {

  late TextEditingController titleController = TextEditingController();
  late TextEditingController contentController = TextEditingController();

  late String title;
  late String writer;
  late String content;
  late String boardCategoryName;

  @override
  void initState() {
    titleController.addListener(() {
      title = titleController.text;
    });
    contentController.addListener(() {
      content = contentController.text;
    });
    // 여기서 로그인 중인 사용자 nickname을 받아올 예정
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
      appBar: CommonAppBar(title: "게시물 작성하기"),
      drawer: CustomDrawer(isLogin: true,),
      body: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  categoryDropDownBtn(),
                  TextFormFieldForBoard(use:"제목", maxLines:1, controller: titleController),
                  SizedBox(height: small_gap,),
                  TextFormFieldForBoard(use:"내용", maxLines:20, controller: contentController),
                  SizedBox(height: small_gap,),
                  Consumer<CategoryProvider>(
                    builder: (context, category, child) {
                      return TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              writer = "철수";
                              boardCategoryName = category.category;
                              // debugPrint("폼에서 카테고리:" + boardCategoryName);
                              SpringBoardApi().requestBoardRegister(BoardRegisterRequest(title, writer, content, boardCategoryName));
                              moveToList(boardCategoryName);
                            } else {
                              showResultDialog(context, "게시물 등록 실패", "제목과 내용을 작성해주세요!");
                            }
                          },
                          child: Text("게시글 등록하기")
                      );
                    }
                  )
                ],
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