import 'package:flutter/material.dart';
import 'package:leaing_helper/utility/decorations/color.dart';

import '../../components/text_form_filed/admin_text_form.dart';
import '../../utility/common_btn/text_btn_box.dart';

class AdminMainPage extends StatefulWidget{
  const AdminMainPage({Key? key}) :super (key:key);

  @override
  State<AdminMainPage> createState() => _AdminMainPage();
}

class _AdminMainPage extends State<AdminMainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 60,left: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment : CrossAxisAlignment.center,
            children: const[
              Text("환영 합니다 , 관리자님",style: TextStyle(fontSize: 17),),
              Text("원하시는 관리 항목을 선택 해주세요",style: TextStyle(fontSize: 17)),
              SizedBox(height: 30,),
              Text("학습 등록",style: TextStyle(fontSize: 17)),
              TextBtnBoxRouter(router: '/learning_register_page', text: '단어 학습 등록 페이지로 이동',),
              TextBtnBoxRouter(router: '/learning_register_page', text: '문법 학습 등록 페이지로 이동',),
              TextBtnBoxRouter(router: '/learning_register_page', text: '독해 학습 등록 페이지로 이동',),
              TextBtnBoxRouter(router: '/learning_register_page', text: '논리 학습 등록 페이지로 이동',),
              SizedBox(height: 30,),
              Text("학습 수정 및 삭제",style: TextStyle(fontSize: 17)),
              TextBtnBoxRouter(router: '/learning_register_page', text: '단어 수정 및 삭제 페이지로 이동',),
              TextBtnBoxRouter(router: '/learning_register_page', text: '문법 수정 및 삭제 페이지로 이동',),
              TextBtnBoxRouter(router: '/learning_register_page', text: '독해 수정 및 삭제 페이지로 이동',),
              TextBtnBoxRouter(router: '/learning_register_page', text: '논리 수정 및 삭제 페이지로 이동',),
            ],
          ),
        ),
      ),
    );
  }


}