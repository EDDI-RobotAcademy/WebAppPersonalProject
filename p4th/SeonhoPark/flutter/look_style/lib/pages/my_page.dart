import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:look_style/components/my_page_tab_bar.dart';
import 'package:look_style/utility/custom_icons_icons.dart';

import '../api/board_spring_api.dart';
import 'board_read_page.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key, this.userToken, this.userEmail, required this.userNickname}) : super(key: key);

  String? userToken;
  String? userEmail;
  String userNickname;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  static final storage = FlutterSecureStorage();
  String? userToken;
  String? userEmail;
  String? userNickname;

  var boardList;

  List<RequestBoard> list = [];

  void getBoardList() {
    boardList.then((value) {
      for (int i = 0; i < value.length; i ++) {
        setState(() {
          list.add(value[i]);
        });
      }
    });
  }

  DateTime updateTime(int index) {
    DateTime time = DateTime.parse(list[index].updDate);

    return time;
  }

  _checkUserState() async {
    userToken = await storage.read(key: 'userToken');
    userEmail = await storage.read(key: 'userEmail');
    userNickname = await storage.read(key: 'userNickname');
  }

  logout() async{
    await storage.delete(key: 'userToken');
    await storage.delete(key: 'userEmail');
    await storage.delete(key: 'userNickname');
    Get.offAllNamed('/');
  }

  late TabController tabController;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _checkUserState();
    });
    boardList = BoardSpringApi().requestBoardListByWriter(widget.userNickname);
    getBoardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.account_circle, size: 100),
                        SizedBox(height: 10),
                        Text('${widget.userEmail}'),
                        SizedBox(height: 10),
                        Text('${widget.userNickname}')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(primary: Colors.black),
                            child: Text('닉네임 변경', style: TextStyle(color: Colors.black),)
                        ),
                        TextButton(
                            onPressed: () {
                              logout();
                              },
                            style: TextButton.styleFrom(primary: Colors.black),
                            child: Text('로그아웃', style: TextStyle(color: Colors.black))
                        ),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(primary: Colors.black),
                            child: Text('회원탈퇴', style: TextStyle(color: Colors.black))
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 1, height: 2),
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (BuildContext c, int index) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Get.to(BoardReadPage(boardNo: list[index].boardNo));
                          },
                          child: Container(
                            // color: Colors.red,
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.account_circle, size: 20,),
                                    SizedBox(width: 10),
                                    Expanded(child: Text('${list[index].writer}', style: TextStyle(fontSize: 12))),
                                    Text('${list[index].boardType} 게시물', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    Text(DateFormat("yyyy/MM/dd").format(updateTime(index)), style: TextStyle(fontSize: 12))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text('${list[index].title}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
