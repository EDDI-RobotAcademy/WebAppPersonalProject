import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/custom_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: customAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("마이페이지", style: TextStyle(
              fontSize: 30
          ),),
        ],
      ),
    );
  }
}
