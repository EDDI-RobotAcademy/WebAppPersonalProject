import 'package:demo/utilities/spring_comment_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/recipe/recipe_detail_screen.dart';
import '../../utilities/check_validate.dart';
import '../text_field_contanier.dart';

class CommentModifyForm extends StatefulWidget {
  final dynamic recipe;
  final dynamic comment;

  const CommentModifyForm({Key? key, required this.comment, required this.recipe}) : super(key: key);

  @override
  State<CommentModifyForm> createState() => _CommentModifyFormState();
}

class _CommentModifyFormState extends State<CommentModifyForm> {
  FocusNode focusNode = FocusNode();
  final TextEditingController _comment = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: TextFieldContanier(
          child: TextFormField(
              validator: (value) =>
                  CheckValidate().validateComment(focusNode, value!),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              controller: _comment,
              decoration: InputDecoration(
                  hintText: "댓글을 입력해주세요.",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(widget.comment.commentNo);
                        print(_comment.text);

                        Future<void> future = SpringCommentApi().commentModify(CommentModifyRequest(
                            commentNo: widget.comment.commentNo,
                            content: _comment.text));
                        future.then((value) {
                          print("댓글 수정 성공");
                          Get.offAll(RecipeDetailScreen(
                              recipeNo: widget.recipe.recipeNo, recipe: widget.recipe));
                        }).catchError((error) {
                          print("댓글 수정 실패");
                        });
                      }
                    },
                  ))),
        ),
      ),
    );
  }
}
