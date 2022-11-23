import 'package:demo/utilities/spring_comment_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';
import '../../screens/recipe/recipe_detail_screen.dart';
import '../../utilities/check_validate.dart';

class CommentFieldForm extends StatefulWidget {
  final String nickname;
  final dynamic recipe;

  const CommentFieldForm(
      {Key? key, required this.nickname, required this.recipe})
      : super(key: key);

  @override
  State<CommentFieldForm> createState() => _CommentFieldFormState();
}

class _CommentFieldFormState extends State<CommentFieldForm> {
  FocusNode focusNode = FocusNode();
  final TextEditingController _comment = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: AppTheme.natureWhite,
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 6,
                child: GestureDetector(
                  onTap: () {
                    focusNode.unfocus();
                  },
                  child: TextFormField(
                    validator: (value) =>
                        CheckValidate().validateComment(focusNode, value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    focusNode: focusNode,
                    style: const TextStyle(fontSize: 15),
                    autofocus: false,
                    controller: _comment,
                    minLines: 3,
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        suffixIcon: focusNode.hasFocus
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _comment.clear();
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.black54,
                                  size: 20,
                                ))
                            : Container(),
                        hintText: "댓글을 달아주세요.",
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                )),
            focusNode.hasFocus
                ? Expanded(
                    child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Future<bool?> future = SpringCommentApi().createComment(
                            CreateCommentRequest(widget.nickname, _comment.text,
                                widget.recipe.recipeNo));
                        future.then((value) {
                          print("댓글 등록 성공");
                          _showSuccessDialog(
                              title: "성공",
                              content: "댓글 등록에 성공했습니다.",
                              buttonText: "확인");
                        }).catchError((error) {
                          print("댓글 등록 실패");
                        });
                      }
                    },
                    child: const Text(
                      '작성',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
                : Expanded(flex: 0, child: Container())
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(
      {String? title, String? content, String? buttonText}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(content!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(buttonText!),
                onPressed: () {
                  Get.off(RecipeDetailScreen(
                      recipeNo: widget.recipe.recipeNo, recipe: widget.recipe));
                },
              )
            ],
          );
        });
  }
}
