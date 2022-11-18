import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todos/controller/sign_in_controller.dart';
import 'package:my_todos/view/sign_in_view.dart';

class MenuDrawer extends StatelessWidget {
  SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,)
          ),
          ListTile(
            title: Text("회원정보변경"),
            trailing: IconButton(icon: Icon(Icons.navigate_next), onPressed: (){},),
          ),
          ListTile(
            title: Text("로그아웃"),
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: (){
                signInController.logout();
                Get.to(() => SignInView());
                },),
          ),
        ],
      ),
    );
  }
}
