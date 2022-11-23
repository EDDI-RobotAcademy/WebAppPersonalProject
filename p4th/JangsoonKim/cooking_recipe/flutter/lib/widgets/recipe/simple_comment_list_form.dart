import 'package:demo/utilities/spring_comment_api.dart';
import 'package:demo/widgets/recipe/comment_modify_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/recipe/recipe_detail_screen.dart';

class SimpleCommentListForm extends StatefulWidget {
  final String nickname;
  final dynamic recipe;
  final List<dynamic>? comments;

  const SimpleCommentListForm(
      {Key? key,
      required this.comments,
      required this.recipe,
      required this.nickname})
      : super(key: key);

  @override
  State<SimpleCommentListForm> createState() => _SimpleCommentListFormState();
}

class _SimpleCommentListFormState extends State<SimpleCommentListForm> {
  bool _onModify = false;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: (_onModify == true && _current == index) ? 205 : 125,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 5, 8),
                  child: Row(
                    children: [
                      Text(
                        widget.comments![index].writer,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      Text(widget.comments![index].regDate),
                      const Spacer(flex: 1),
                      (widget.nickname == widget.comments![index].writer)
                          ? Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _current = index;
                                        _onModify = true;
                                      });
                                    },
                                    child: const Text("수정",
                                        style: TextStyle(color: Colors.grey))),
                                TextButton(
                                    onPressed: () {
                                      print("삭제요청");
                                      Future future = SpringCommentApi()
                                          .commentDelete(widget
                                              .comments![index].commentNo);
                                      future.then((value) {
                                        print("댓글 삭제 성공");
                                        Get.offAll(RecipeDetailScreen(
                                            recipeNo: widget.recipe.recipeNo,
                                            recipe: widget.recipe));
                                      }).catchError((error) {
                                        print("댓글 삭제 실패");
                                      });
                                    },
                                    child: const Text("삭제",
                                        style: TextStyle(color: Colors.grey)))
                              ],
                            )
                          : const Text(""),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(widget.comments![index].content),
                ),
                (_onModify == true && _current == index)
                    ? CommentModifyForm(
                        comment: widget.comments![index],
                        recipe: widget.recipe,
                      )
                    : Container()
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              color: Colors.black,
            ),
        itemCount: (widget.comments!.length < 5) ? widget.comments!.length : 5);
  }
}
