import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/mypage/mypage_form.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: customAppbar('EZ.COOK'),
      body: const MypageForm()
    );
  }
}
