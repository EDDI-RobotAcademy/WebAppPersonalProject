import 'package:flutter/material.dart';

import '../widgets/drawer/custom_drawer.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
        title: Text('EZ.COOK'),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("이벤트", style: TextStyle(
              fontSize: 30
          ),),
        ],
      ),
    );
  }
}
