import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/custom_drawer.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: customAppbar('EZ.COOK'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("공지사항", style: TextStyle(
              fontSize: 30
          ),),
        ],
      ),
    );
  }
}
