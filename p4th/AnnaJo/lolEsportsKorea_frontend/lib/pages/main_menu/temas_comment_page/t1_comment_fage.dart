import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:lol_esports_korea_app/components/my_team/team_comment_data.dart';

import '../../../api/comment/spring_comment_api.dart';
import '../../../components/app_bar/common_top_app_bar.dart';
import '../../../utility/common_alert_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

bool load = false;
String myTeam = 'T1';
List<TeamCommentData> commentLists = [];

class T1CommentTestPage extends StatefulWidget {
  const T1CommentTestPage({Key? key}) : super(key: key);

  @override
  _T1CommentTestPage createState() => _T1CommentTestPage();
}

class _T1CommentTestPage extends State<T1CommentTestPage> {
  static const _storage = FlutterSecureStorage();
  dynamic nickname = '';
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String formatDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  commentRegisterAction() async {
    CommentRequest commentRequest = CommentRequest('T1', nickname,
        'assets/images/T1.png', commentController.text, formatDate);

    await SpringCommentApi().registerApi(commentRequest);

    if (SpringCommentApi.commentRegisterResponse.statusCode == 200) {
      setState(() {
        getCommentList(myTeam);
      });
      debugPrint('댓글 등록 성공');
    } else {
      _commentFailShowDialog();
      debugPrint('error');
    }
  }

  @override
  void initState() {
    super.initState();
    getCommentList(myTeam);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkUserState();
    });
  }

  Future getCommentList(String request) async {
    await SpringCommentApi.getCommentListApi(request).then((commentList) {
      debugPrint("commentList : " + commentList.toString());
      commentLists.clear();
      for (var i = 0; i < commentList.length; i++) {
        commentLists.add(TeamCommentData(
            myTeam: commentList[i].myTeam,
            nickName: commentList[i].nickName,
            teamProfile: commentList[i].teamProfile,
            contents: commentList[i].contents,
            date: commentList[i].date));
      }
      debugPrint("commentLists : " + commentLists[0].contents);
    });
  }

  /// 회원 닉네임 불러오기
  Future<void> checkUserState() async {
    try {
      nickname = await _storage.read(key: 'nickname');
      setState(() {
        nickname = nickname;
      });
    } catch (e) {
      debugPrint('e');
    }
  }

  Widget commentChild(commentLists) {
    return ListView(
      children: [
        for (var i = 0; i < commentLists.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: commentLists[i].teamProfile),
                      backgroundColor: Colors.black),
                ),
              ),
              title: Text(
                commentLists[i].nickName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(commentLists[i].contents),
              trailing: Text(commentLists[i].date,
                  style: const TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonTopAppBar(
          title: const Text('T1'),
          appBar: AppBar(),
        ),
        body: SmartRefresher(
          controller: _refreshController,
          onLoading: _onLoading,
          child: Container(
            child: CommentBox(
              child: commentChild(commentLists),
              labelText: 'Write a comment...',
              errorText: 'Comment cannot be blank',
              withBorder: false,
              sendButtonMethod: () {
                if (formKey.currentState!.validate()) {
                  commentRegisterAction();
                  _refreshController.refreshCompleted();
                  commentController.clear();
                  FocusScope.of(context).unfocus();
                } else {
                  debugPrint("Not validated");
                }
              },
              formKey: formKey,
              commentController: commentController,
              backgroundColor: const Color(0xff23124b),
              textColor: Colors.white,
              sendWidget:
                  const Icon(Icons.send_sharp, size: 30, color: Colors.white),
            ),
          ),
        ));
    // }
  }

  /// 댓글 등록 실패 alertDialog
  void _commentFailShowDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            title: "⚠️",
            content: '죄송합니다. \n 댓글 등록이 실패했습니다.😥 ',
            onCustomButtonPressed: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    debugPrint("onLoading");
    if (mounted) {
      setState(() {
        commentChild;
      });
    }
    _refreshController.loadComplete();
  }
}
