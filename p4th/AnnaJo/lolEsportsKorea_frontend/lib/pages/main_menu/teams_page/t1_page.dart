import 'package:flutter/material.dart';

import '../../../components/app_bar/common_top_app_bar.dart';

class T1Page extends StatefulWidget {
  const T1Page({Key? key}) : super(key: key);

  @override
  State<T1Page> createState() => _T1PageState();
}

class _T1PageState extends State<T1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonTopAppBar(
          title: const Text('T1'),
          appBar: AppBar(),
        ),
        body: Text("T1Page"));
  }
}
