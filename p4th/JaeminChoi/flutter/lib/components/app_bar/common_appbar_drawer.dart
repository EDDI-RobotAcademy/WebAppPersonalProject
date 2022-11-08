import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAppbarDrawer extends StatelessWidget{
  const CommonAppbarDrawer({Key?key}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.house),
            title: Text("test1"),
            onTap: (){print("test1");},
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text("test1"),
            onTap: (){print("test1");},
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text("test1"),
            onTap: (){print("test1");},
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text("test1"),
            onTap: (){print("test1");},
          ),
        ],
      ),
    );
  }
}