import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/register_todos_view.dart';
import '../component/todos_list_builder.dart';

class MyMainView extends StatelessWidget {
  const MyMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Main"),shadowColor: Colors.transparent, ),
      body: Container(
          child: MyTodoList()
      ),

      floatingActionButton:Container(
          margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
          height: 70.0,
          width: 70.0,
          child: FittedBox(
              child: FloatingActionButton(
                  child: Icon(
                    Icons.edit,
                  ),
                  onPressed: () {Get.to(() => RegisterTodosView());}
              )
          )
      )
    );
  }
}
