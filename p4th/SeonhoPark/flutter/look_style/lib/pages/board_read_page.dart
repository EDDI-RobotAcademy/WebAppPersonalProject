import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:look_style/pages/board_modify_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:look_style/api/board_spring_api.dart';

class BoardReadPage extends StatefulWidget {
  BoardReadPage({Key? key, required this.boardNo}) : super(key: key);

  int boardNo;

  @override
  State<BoardReadPage> createState() => _BoardReadPageState();
}

class _BoardReadPageState extends State<BoardReadPage> {
  static final storage = FlutterSecureStorage();
  String? userNickname;

  var imageNameList;
  var boardData;
  var list = [];
  PageController _pageController = PageController();

  late RequestBoard board;
  bool checkImageExistence = false;

  void getBoard() async {
    await boardData.then((value) {
      setState(() {
        board = value;
      });
    });
  }

  void getImageName() {
    imageNameList.then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          list.add(value[i].imageName);
          if (value[i].imageName != null) {
            checkImageExistence = true;
            print(checkImageExistence);
          }
          print(checkImageExistence);
        });
      }
    });
  }

  void _getUserNickname() async {
    userNickname = await storage.read(key: 'userNickname');
  }

  bool? checkWriterCurrentBoard() {
    if(userNickname == board.writer) {
      return true;
    } else {
      return false;
    }
  }

  DateTime updateTime() {
    DateTime time = DateTime.parse(board.updDate);

    return time;
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getUserNickname();
    });
    imageNameList = BoardSpringApi().requestBoardImage(widget.boardNo);
    boardData = BoardSpringApi().requestBoard(widget.boardNo);
    getImageName();
    getBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Look Style",
          style:
          TextStyle(color: Colors.black, fontFamily: 'bazzi', fontSize: 25),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white10,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Icon(Icons.account_circle),
                  SizedBox(width: 10),
                  Expanded(child: Text('${board.writer}', style: TextStyle(fontSize: 16, ))),
                  if(checkWriterCurrentBoard()!) TextButton(
                      onPressed: () {
                        Get.to(BoardModifyPage(
                            nickname: board.writer,
                            boardType: board.boardType,
                            boardNo: board.boardNo,
                            boardTitle: board.title,
                            boardContent: board.content,
                            regDate: board.regDate,
                        ));
                      },
                      child: Text('수정')),
                  if(checkWriterCurrentBoard()!) TextButton(
                      onPressed: () {

                      },
                      child: Text('삭제'))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
                child: Text('${board.title}', style: TextStyle(fontSize: 14), maxLines: 2, overflow: TextOverflow.ellipsis)
            ),
            if(checkImageExistence) SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      child: Image.asset('assets/${list[index]}', fit: BoxFit.cover,),
                    );
                  }
              ),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {}, icon: Icon(Icons.comment_outlined)),
                ),
                if (checkImageExistence) Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: list.length,
                      effect: ScrollingDotsEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                      ),
                    ),
                  )
                )
              ],
            ),
            Divider(thickness: 0.7, height: 20),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
                child: Text(DateFormat("yyyy/MM/dd").format(updateTime()), style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('${board.content}', style: TextStyle(fontSize: 13),maxLines: 5, overflow: TextOverflow.ellipsis,)),
            Divider(thickness: 1, height: 10)
          ],
        ),
      )
    );
  }
}
