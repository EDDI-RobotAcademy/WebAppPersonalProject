import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../api/spring_sign_in_api.dart';
import '../../components/app_bar/common_app_bar.dart';
import '../../components/app_bar/common_appbar_drawer.dart';
import '../../utility/common_btn/text_btn_box.dart';
import '../../utility/decorations/text_style.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key?key}) : super(key: key);


  @override
  State<PersonalPage> createState() => _PersonalPage();

}
class _PersonalPage extends State<PersonalPage>{
  static final signInStorage = FlutterSecureStorage();
  var accountInfo;

  @override
  void initState(){
    super.initState();
    readUserNickName();
  }

  readUserNickName() async {
    accountInfo = (await signInStorage.read(key: "sign_in"));
    debugPrint("accountInfo : "+accountInfo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar( appBar: AppBar()),
      drawer: const CommonAppbarDrawer(),
      resizeToAvoidBottomInset: false,
      body: Form(
          child: Container(
            padding: const EdgeInsets.only(top: 50, left: 40),
             child: Column(
               children: [
                 const SizedBox(height: 50,),
                 Row(
                   children: [
                     SizedBox(
                         height: 40,
                         width: 100,
                         child: Text("Hello, " ,style:welcomeTextStyleBlackInPersonalPage(), textAlign: TextAlign.right,)
                     ),
                     SizedBox(
                      height: 40,
                      width: 150,
                      child: Text( SpringSignInApi.userNickName ?? "visitor",style:welcomeTextStyleBlackInPersonalPage(), textAlign: TextAlign.left,)
                ),
                   ],
                 ),
                 const SizedBox( height: 60,width : 300,child: Text("오늘 하루도 힘내서 열심히 공부 합시다!",style: TextStyle(fontSize: 12),)),
                 const TextBtnBoxRouter(text: '편입 영어 학습 ', router: '/select_subject_page',),
                 const TextBtnBoxRouter(text: '편입 영어 공부 tip 게시판', router: '/select_subject_page',),
                 const TextBtnBoxRouter(text: '나만의 단어장', router: '/select_subject_page',),
                 const TextBtnBoxRouter(text: '나만의 학습 계획 세우기 ', router: '/select_subject_page',),
              ],
            ),
         )
      ),
    );
  }
  
}