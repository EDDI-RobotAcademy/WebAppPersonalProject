import 'package:flutter/material.dart';

import '../components/text_btn_box.dart';
import '../components/logo.dart';
import '../components/text_form_filed/email_text_form_field.dart';
import '../utility/size.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children:  const [
              SizedBox(height: medium_gap,),
              Logo(title: "Leaning_helper",),
              SizedBox(height: large_gap,),
              TextBtnBoxRouter(text: '로그인',router: '/sign_in_view',),
            ],
          ),
        )
    );
  }


}

