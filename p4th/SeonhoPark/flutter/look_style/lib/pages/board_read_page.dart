import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:look_style/api/board_comment_spring_api.dart';
import 'package:look_style/components/board/comment/comment_register_form.dart';
import 'package:look_style/pages/board_modify_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:look_style/api/board_spring_api.dart';

import 'main_page.dart';

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
  var commentList;
  var list = [];
  List<RequestComment> comments = [];
  List<BoardImage> imageNumberList = [];
  PageController _pageController = PageController();

  late RequestBoard board;
  bool checkImageExistence = false;

  late String modifyCommentContent;

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
          imageNumberList.add(value[i]);
          if (value[i].imageName != null) {
            checkImageExistence = true;
            print(checkImageExistence);
          }
          print(checkImageExistence);
        });
      }
    });
  }

  void getCommentList() {
    commentList.then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          comments.add(RequestComment(commentId: value[i].commentId, writer: value[i].writer, content: value[i].content, regDate: value[i].regDate, updDate: value[i].updDate));
        });
        print(comments[i].commentId);
        print(comments[i].writer);
        print(comments[i].content);
        print(comments[i].regDate);
        print(comments[i].updDate);
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

  bool? checkWriterCurrentComment(int index) {
    if(userNickname == comments[index].writer) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getUserNickname();
    });
    imageNameList = BoardSpringApi().requestBoardImage(widget.boardNo);
    boardData = BoardSpringApi().requestBoard(widget.boardNo);
    commentList = BoardCommentSpringApi().findAllCommentsOnSpecificBoard(widget.boardNo);
    getImageName();
    getBoard();
    getCommentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Get.offAll(MainPage());
          },
          child: Text(
            "Look Style",
            style:
            TextStyle(color: Colors.black, fontFamily: 'bazzi', fontSize: 25),
          ),
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
                                    "게시물을 수정하시겠습니까?",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                actions: [
                                  TextButton(
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
                                    child: Text(
                                      "확인", style: TextStyle(color: Colors.black),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "취소", style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              );
                            }
                        );
                      },
                      child: Text('수정')),
                  if(checkWriterCurrentBoard()!) TextButton(
                      onPressed: () {
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
                                    "정말 게시물을 삭제하시겠습니까?",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
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
                                                  "게시물이 성공적으로 삭제되었습니다.",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    var success = BoardSpringApi().deleteBoard(board.boardNo);
                                                    success.then((value) {
                                                      if (value == true) {
                                                        Get.offAll(MainPage());
                                                      }
                                                    });
                                                  },
                                                  child: Text(
                                                    "확인", style: TextStyle(color: Colors.black),),
                                                ),
                                              ],
                                            );
                                          }
                                      );
                                    },
                                    child: Text(
                                      "확인", style: TextStyle(color: Colors.black),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "취소", style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              );
                            }
                        );
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
            Divider(thickness: 1, height: 10),
            CommentRegisterForm(boardNo: board.boardNo, writer: userNickname!,),
            SizedBox(height: 20),
            Column(
                children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: comments.length,
                        itemBuilder: (BuildContext c, int index) {
                          return Container(
                            // color: Colors.red,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(thickness: 0.7, height: 2),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.account_circle),
                                    SizedBox(width: 5),
                                    Expanded(child: Text('${comments[index].writer}')),
                                    Text(DateFormat("yyyy/MM/dd hh.mm").format(DateTime.parse(comments[index].regDate)), style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                    if (checkWriterCurrentComment(index)!) TextButton(
                                        onPressed: () {
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
                                                      "댓글을 수정하시겠습니까?",
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
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
                                                                  child: Center(
                                                                    child: TextFormField(
                                                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                      initialValue: comments[index].content,
                                                                      validator: (text) {
                                                                        if (text!.isEmpty) {
                                                                          return null;
                                                                        }
                                                                      },
                                                                      onChanged: (text) {
                                                                        modifyCommentContent = text;
                                                                      },
                                                                    ),
                                                                  )
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      if(modifyCommentContent.isNotEmpty) {
                                                                        var success = BoardCommentSpringApi().modifyComment(
                                                                            comments[index].commentId,
                                                                            comments[index].writer,
                                                                            modifyCommentContent,
                                                                            comments[index].regDate,
                                                                            board.boardNo
                                                                        );
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
                                                                                        "댓글 수정이 성공적으로 완료되었습니다.",
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () {
                                                                                          Get.offAll(BoardReadPage(boardNo: board.boardNo));
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
                                                                    child: Text(
                                                                      "수정", style: TextStyle(color: Colors.black),),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                      "취소", style: TextStyle(color: Colors.black),),
                                                                  ),
                                                                ],
                                                              );
                                                            }
                                                        );
                                                      },
                                                      child: Text(
                                                        "확인", style: TextStyle(color: Colors.black),),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "취소", style: TextStyle(color: Colors.black),),
                                                    ),
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        style: TextButton.styleFrom(primary: Colors.black, padding: EdgeInsets.zero, minimumSize: Size(40, 20), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                        child: Text('수정', style: TextStyle(fontSize: 10),)
                                    ),
                                    if (checkWriterCurrentComment(index)!) TextButton(
                                        onPressed: () {
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
                                                      "댓글을 삭제하시겠습니까?",
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        var success = BoardCommentSpringApi().deleteComment(comments[index].commentId);
                                                        success.then((value) {
                                                          if (value == true) {
                                                            Get.offAll(BoardReadPage(boardNo: board.boardNo));
                                                          } else {
                                                            print("뭐지????????????");
                                                          }
                                                        });
                                                      },
                                                      child: Text("확인"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "취소", style: TextStyle(color: Colors.black),),
                                                    ),
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        style: TextButton.styleFrom(primary: Colors.black, padding: EdgeInsets.zero, minimumSize: Size(40, 20), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                        child: Text('삭제', style: TextStyle(fontSize: 10),)
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text('${comments[index].content}', style: TextStyle(fontSize: 12),),
                                SizedBox(height: 10),
                                Divider(thickness: 0.7, height: 2),
                              ],
                            ),
                          );
                        }
                    )
                ]
            )
          ],
        ),
      )
    );
  }
}
