import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

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
            trailing: IconButton(icon: Icon(Icons.navigate_next), onPressed: (){},),
          ),
        ],
      ),
    );
  }
}
