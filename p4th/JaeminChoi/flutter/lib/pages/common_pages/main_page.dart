import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:leaing_helper/utility/decorations/buttonStyle.dart';

import '../../components/app_bar/common_app_bar.dart';
import '../../components/app_bar/common_appbar_drawer.dart';
import '../../utility/size.dart';

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  static final storage = FlutterSecureStorage(); //
  dynamic userInfo = ' ';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }
  _asyncMethod() async {
    userInfo = await storage.read(key:'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonAppBar( appBar: AppBar()),
        drawer: const CommonAppbarDrawer(),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30 , bottom: 30 , right: 5 , left: 5),
            child : Column(
              mainAxisSize: MainAxisSize.max,
              children:  [
                ElevatedButton.icon(
                  style: elevatedButtonStyle(large_btn_width, medium_btn_height),
                  onPressed: (){print("test");},
                  label : const Text("테스트 버튼 입니다                                     >" ,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  icon: const Icon(Icons.account_balance_wallet , size: 50, color: Colors.black,),
                ),
                ElevatedButton.icon(
                  style: elevatedButtonStyle(large_btn_width, medium_btn_height),
                  onPressed: (){Navigator.pushNamed(context, "/sign_in_page");},
                  label : const Text("로그인 이동                                               >" ,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  icon: const Icon(Icons.account_balance_wallet , size: 50, color: Colors.black,),
                ),
                ElevatedButton.icon(
                  style: elevatedButtonStyle(large_btn_width, medium_btn_height),
                  onPressed: (){Navigator.pushNamed(context, "/sign_up_page");},
                  label : const Text("회원가입 이동                                            >" ,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  icon: const Icon(Icons.account_balance_wallet , size: 50, color: Colors.black,),
                ),
                ElevatedButton.icon(
                  style: elevatedButtonStyle(large_btn_width, medium_btn_height),
                  onPressed: (){Navigator.pushNamed(context, "/personal_page");},
                  label : const Text("개인페이지                                            >" ,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  icon: const Icon(Icons.account_balance_wallet , size: 50, color: Colors.black,),
                ),
                ElevatedButton.icon(
                  style: elevatedButtonStyle(large_btn_width, medium_btn_height),
                  onPressed: (){Navigator.pushNamed(context, "/admin_main_page");},
                  label : const Text("관리자 페이지                                            >" ,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  icon: const Icon(Icons.account_balance_wallet , size: 50, color: Colors.black,),
                ),

              ],
            )
          ),
        )
    );
  }


}

