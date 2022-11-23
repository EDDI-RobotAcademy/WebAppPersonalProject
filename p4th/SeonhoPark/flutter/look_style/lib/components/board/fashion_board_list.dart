import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_style/api/board_spring_api.dart';
import 'package:look_style/pages/board_read_page.dart';
import 'package:get/get.dart';

class FashionBoardList extends StatefulWidget {
  const FashionBoardList({Key? key}) : super(key: key);

  @override
  State<FashionBoardList> createState() => _FashionBoardListState();
}

class _FashionBoardListState extends State<FashionBoardList> {

  var boardList = BoardSpringApi().boardList("패션");

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


  @override
  void initState() {
    getBoardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_circle, size: 30,),
                              SizedBox(width: 10),
                              Text('${list[index].writer}')
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('${list[index].title}', style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
