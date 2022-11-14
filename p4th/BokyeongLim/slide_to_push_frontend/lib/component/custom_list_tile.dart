import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/todo_list_controller.dart';


//ignore: must_be_immutable
class CustomListTile extends StatefulWidget {
  var todos;
  CustomListTile(this.todos);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  var todos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos = widget.todos;
  }

  late bool status = todos.isFinished;
  ListController listController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 15, 5, 15),
      decoration: BoxDecoration(border:Border(bottom: BorderSide(color: Colors.black26, width: 0.5))),
      child: ListTile(
          title: Container(
            child: Text(todos.content),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                  value: status,
                  onChanged: (bool value) {
                    listController.toggle(todos.boardNo);
                    setState(() {status = value;});
                  }
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.black45,
                highlightColor: Colors.blueAccent,
                onPressed: () async{
                  bool result = await listController.delete(todos.boardNo);

                  if (result) {
                    Get.snackbar(
                      'SUCCESS',
                      '삭제 성공하였습니다.',
                      backgroundColor: Colors.white,
                    );
                    listController.fetchData();

                  } else {
                    Get.snackbar(
                      'FAILED',
                      '토큰 만료로 삭제에 실패하였습니다.',
                      backgroundColor: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
      ),
    );
  }
}






