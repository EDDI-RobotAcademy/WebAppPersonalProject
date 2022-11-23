import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../widgets/recipe/all_comments_form.dart';

class AllCommentsScreen extends StatefulWidget {
  final List<dynamic>? comments;
  final String nickname;
  final dynamic recipe;

  const AllCommentsScreen({Key? key, required this.comments, required this.nickname, required this.recipe}) : super(key: key);

  @override
  State<AllCommentsScreen> createState() => _AllCommentsScreenState();
}

class _AllCommentsScreenState extends State<AllCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("댓글  ${widget.comments!.length}"),
      body: AllCommentsForm(comments: widget.comments, nickname: widget.nickname, recipe: widget.recipe,),
    );
  }
}
