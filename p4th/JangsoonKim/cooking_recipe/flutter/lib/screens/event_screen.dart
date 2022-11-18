import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/custom_drawer.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: customAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("이벤트", style: TextStyle(
              fontSize: 30
          ),),
        ],
      ),
    );
  }
}
