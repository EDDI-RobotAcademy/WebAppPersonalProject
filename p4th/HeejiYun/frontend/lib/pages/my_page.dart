import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/forms/my_page_form.dart';
import '../components/logo.dart';
import '../utility/size.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: CommonAppBar(title: "MY PAGE"),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: const [
                  SizedBox(height: small_gap,),
                  Logo(title: "내 정보",),
                  SizedBox(height: small_gap,),
                  MyPageForm(),
                ],
              ),
            ),
        drawer: CustomDrawer()
      );
  }
}
