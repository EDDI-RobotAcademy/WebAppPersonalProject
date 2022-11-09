import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/custom_drawer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: CustomAppbar(),
      body: Column(
        children: [
          Text("검색페이지"),
        ],
      ),
    );
  }
}
