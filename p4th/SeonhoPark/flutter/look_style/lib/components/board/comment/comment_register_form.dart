import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_style/api/board_comment_spring_api.dart';
import 'package:look_style/pages/board_read_page.dart';

class CommentRegisterForm extends StatefulWidget {
  CommentRegisterForm({Key? key, required this.boardNo, required this.writer}) : super(key: key);

  int boardNo;
  String writer;

  @override
  State<CommentRegisterForm> createState() => _CommentRegisterFormState();
}

class _CommentRegisterFormState extends State<CommentRegisterForm> {

  final _formKey = GlobalKey<FormState>();

  String? content;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (text) {
              if (text!.isEmpty) {
                return '';
              }
            },
            onChanged: (text) {
              content = text;
            },
            decoration: InputDecoration(
              focusColor: Colors.black,
              prefixIcon: Icon(Icons.comment_outlined),
              suffixIcon: IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(content);
                      var success = BoardCommentSpringApi().registerComment(Comment(widget.boardNo, widget.writer, content!));
                      success.then((value) {
                        if (value == true) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Center(child: Text('Look Style',
                                    style: TextStyle(fontFamily: 'bazzi'),)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .circular(20)),
                                  content: Container(
                                    width: 300,
                                    height: 100,
                                    child: Text(
                                      "댓글이 성공적으로 등록되었습니다.",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.offAll(BoardReadPage(boardNo: widget.boardNo));
                                      },
                                      child: Text(
                                        "확인", style: TextStyle(color: Colors.black),),
                                    ),
                                  ],
                                );
                              }
                          );
                        }
                      });
                    }
                  },
                  icon: Icon(Icons.send)
              ),
              hintText: '댓글 작성...',
              hintStyle: TextStyle(fontSize: 11),
            ),
          ),
        )
    );
  }
}
