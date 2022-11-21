import 'package:flutter/material.dart';

import '../../../components/app_bar/common_top_app_bar.dart';

class DrxPage extends StatefulWidget {
  const DrxPage({Key? key}) : super(key: key);

  @override
  State<DrxPage> createState() => _DrxPageState();
}

class _DrxPageState extends State<DrxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonTopAppBar(
          title: const Text('DRX'),
          appBar: AppBar(),
        ),
        body: SingleChildScrollView());
  }
}
