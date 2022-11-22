import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../components/app_bar/common_app_bar.dart';
import '../../components/app_bar/common_appbar_drawer.dart';
import '../../utility/common_btn/text_btn_box.dart';
import '../../utility/size.dart';
import '../common_pages/main_page.dart';


class AdminMainPage extends StatefulWidget{
  const AdminMainPage({Key? key}) :super (key:key);

  @override
  State<AdminMainPage> createState() => _AdminMainPage();
}

class _AdminMainPage extends State<AdminMainPage>{

  static final storage = FlutterSecureStorage(); //
  dynamic userTokenInfo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userTokenInfo = await storage.read(key:'sign_in');
    debugPrint("userTokenInfo in adminPage = " + userTokenInfo);
  }

  void logout() async {
    await storage.delete(key: 'sign_in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar( appBar: AppBar()),
      drawer: const CommonAppbarDrawer(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 60,left: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment : CrossAxisAlignment.center,
            children: [
              const Text("환영 합니다 , 관리자님",style: TextStyle(fontSize: 17),),
              const Text("원하시는 관리 항목을 선택 해주세요",style: TextStyle(fontSize: 17)),
              const SizedBox(height: 30,),
              const Text("학습 등록",style: TextStyle(fontSize: 17)),
              const TextBtnBoxRouter(router: '/learning_register_page', text: '단어 학습 등록 페이지로 이동',),
              const TextBtnBoxRouter(router: '/learning_register_page', text: '문법 학습 등록 페이지로 이동',),
              const TextBtnBoxRouter(router: '/learning_register_page', text: '독해 학습 등록 페이지로 이동',),
              const TextBtnBoxRouter(router: '/learning_register_page', text: '논리 학습 등록 페이지로 이동',),
              const SizedBox(height: 30,),
              const Text("학습 수정 및 삭제",style: TextStyle(fontSize: 17)),
              const SizedBox(height: small_gap,),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_degree_page');
                  },
                  child: const Text("단어 수정 및 삭제 페이지로 이동")),
              const SizedBox(height: small_gap,),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_degree_page');
                  },
                  child: const Text('문법 수정 및 삭제 페이지로 이동')),
              const SizedBox(height: small_gap,),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_degree_page');
                  },
                  child: const Text('독해 수정 및 삭제 페이지로 이동')),
              const SizedBox(height: small_gap,),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_degree_page');
                  },
                  child: const Text('논리 수정 및 삭제 페이지로 이동')),
              const SizedBox(height: small_gap,),
              TextButton(
                  onPressed: () {
                    logout();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage() ));
                  },
                  child: const Text('로그 아웃')),
            ],
          ),
        ),
      ),
    );
  }


}