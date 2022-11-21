import 'package:demo/widgets/custom_appbar.dart';
import 'package:demo/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class MoreInformationScreen extends StatelessWidget {
  const MoreInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('EZ.COOK'),
      endDrawer: CustomDrawer(),
      body: Column(
        children: [
          Text("더보기 페이지")
        ],
      ),
    );
  }
}
