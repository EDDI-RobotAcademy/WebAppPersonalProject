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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
            child : Column(
              children: const [
                SizedBox(height: xmedium_gap,),
                Logo(title: "Leaning_helper",),
                SizedBox(height: large_gap,),
                TextBtnBoxRouter(text: '로그인',router: '/sign_in_page',),
                TextBtnBoxRouter(text: '회원가입',router: '/sign_up_page',),
              ],
            )
          ),
        )
    );
  }


}

