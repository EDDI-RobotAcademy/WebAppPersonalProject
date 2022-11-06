import 'dart:convert';
import 'package:flutter/material.dart';

import '../api/http_service_api.dart';
import '../api/states/todos_info.dart';
import '../utility/color.dart';
import '../utility/my_custom_scroll_behavior.dart';
import 'inputs/switch_button.dart';


class TodosList extends StatefulWidget {
  const TodosList({Key? key}) : super(key: key);

  Future<List<TodosInfo>> fetchInfo() async {
    await HttpService().requestListFromSpring();

    if(HttpService.reqList.statusCode == 200) {
      var res = jsonDecode(utf8.decode(HttpService.reqList.bodyBytes));

      List<dynamic> body = res;

      List<TodosInfo> allInfo =
      body.map((dynamic item) => TodosInfo.fromJson(item)).toList();

      return allInfo;
    } else {
      //만약 응답이 ok가 아니면 에러를 던집니다.
      throw Exception('불러오는데 실패했습니다');
    }
  }

  @override
  State<TodosList> createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  // 데이터 불러옴
  Future<List<TodosInfo>>? info;
  Future<List<TodosInfo>>? clickedInfo;
  
  @override
  void initState() {
    super.initState();
    info = widget.fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            FutureBuilder<List<TodosInfo>>(
              //통신데이터 가져오기
              future: info,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return todoComponent(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}에러!!");
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget todoComponent(snapshot) {
    return ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.length,
            itemBuilder: (context, i) {
              return Dismissible(
                  key: Key(snapshot[i].boardNo.toString()),
                  onDismissed: (direction){
                    HttpService().requestListDeleteFromSpring(snapshot[i].boardNo);
                    setState(() {
                      snapshot.removeAt(i);
                    });
                  },
                  child:Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: ColorPicker.defaultBlack, width: 5)
                      ),
                      color: ColorPicker.weakPink,
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshot[i].content.toString(),
                                style: TextStyle(
                                  fontFamily: 'AppleSDGothicNeoM',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: ColorPicker.defaultBlack,
                                ),
                              ),
                            ),
                            flex: 8,
                          ),
                          Flexible(
                            child: CustomSwitch(status: snapshot[i].isFinished, boardNo: snapshot[i].boardNo,),
                            flex: 2,
                          ),
                        ],
                      ),
                  ),
              );
            }
        )
    );
  }
}
