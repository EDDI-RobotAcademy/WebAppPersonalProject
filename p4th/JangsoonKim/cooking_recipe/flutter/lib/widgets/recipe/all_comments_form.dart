import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/recipe/recipe_detail_screen.dart';
import '../../utilities/spring_comment_api.dart';
import 'comment_modify_form.dart';

class AllCommentsForm extends StatefulWidget {
  final List<dynamic>? comments;
  final String nickname;
  final dynamic recipe;

  const AllCommentsForm({Key? key, required this.comments, required this.nickname, required this.recipe}) : super(key: key);

  @override
  State<AllCommentsForm> createState() => _AllCommentsFormState();
}

class _AllCommentsFormState extends State<AllCommentsForm> {
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
                      Text(widget.comments![index].writer),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Text(widget.comments![index].regDate),
                      Spacer(flex: 1),
                      (widget.nickname == widget.comments![index].writer)?
                      Row(
                        children: [
                          TextButton(onPressed: (){
                            setState(() {
                              _current = index;
                              _onModify = true;
                            });
                          }, child: Text("수정", style: TextStyle(color: Colors.grey))),
                          TextButton(onPressed: (){
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
                          }, child: Text("삭제", style: TextStyle(color: Colors.grey)))

                        ],
                      )
                          :Text("")
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
        itemCount: widget.comments!.length);
  }
}
