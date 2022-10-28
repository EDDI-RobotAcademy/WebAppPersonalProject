import 'package:flutter/material.dart';

import '../components/text_btn_box.dart';
import '../components/logo.dart';
import '../components/text_form_field.dart';
import '../utility/size.dart';

class MainManu extends StatefulWidget{
  const MainManu({Key? key}) : super(key: key);

  @override
  _MainManuState createState() => _MainManuState();
}

class _MainManuState extends State<MainManu>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children:  [
              const SizedBox(height: medium_gap,),
              const Logo(title: "Leaning_helper",),
              const SizedBox(height: large_gap,),
              const TextBtnBoxRouter(text: '로그인',router: '/sign_in',),
              CustomTextFormField(text: "test",),
            ],
          ),
        )
    );
  }


}

