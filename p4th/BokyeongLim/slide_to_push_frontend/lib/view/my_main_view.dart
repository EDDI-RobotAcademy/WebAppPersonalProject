import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/friend_drawer.dart';
import '../component/navi_menu.dart';
import '../view/register_todos_view.dart';
import '../component/todos_list_builder.dart';

class MyMainView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87,),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                icon: Icon(Icons.person, color: Colors.black87,),
                onPressed: () {Scaffold.of(context).openEndDrawer(); });
          })
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MenuDrawer(),
      endDrawer: FriendsDrawer(),
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
