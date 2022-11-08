import 'dart:convert';

import 'package:flutter/material.dart';

import '../api/http_service_api.dart';
import '../api/states/todos_info.dart';
import '../utility/color.dart';
import '../utility/my_custom_scroll_behavior.dart';


Future<List<TodosInfo>> fetchInfo() async {
  await HttpService().requestListFromSpring();

  if(HttpService.reqList.statusCode == 200) {
    var res = jsonDecode(HttpService.reqList.body);

    debugPrint(res.length.toString());
    debugPrint(res[0].toString());

    List<dynamic> body = res;

    List<TodosInfo> allInfo =
    body.map((dynamic item) => TodosInfo.fromJson(item)).toList();

    return allInfo;
  } else {
    //만약 응답이 ok가 아니면 에러를 던집니다.
    throw Exception('불러오는데 실패했습니다');
  }
}

class TodosList extends StatefulWidget {
  const TodosList({Key? key}) : super(key: key);

  @override
  State<TodosList> createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  Future<List<TodosInfo>>? info;
  Future<List<TodosInfo>>? clickedInfo;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    info = fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            FutureBuilder<List<TodosInfo>>(
              //통신데이터 가져오기
              future: info,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return todoCard(snapshot.data);
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

  Widget todoCard(snapshot) {
    return ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.length,
            itemBuilder: (context, i) {
              return Container(
                padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: ColorPicker.defaultBlack, width: 2.5)
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.amber,
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
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        //checkbox at left
                        value: snapshot[i].isFinished,
                        onChanged: (bool? value) {
                          isFinished = snapshot[i].isFinished;

                          if(snapshot[i].isFinished) {
                            setState(() {
                              isFinished = value!;
                            });
                          }

                        },
                      ),
                      flex: 2,
                    ),
                  ],
                ),
              );
            }
        )
    );
  }
}
