import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/buttons/navigation_button.dart';

import '../components/custom_app_bar.dart';
import '../components/logo.dart';
import '../utility/size.dart';

class SignUpCompletePage extends StatelessWidget {
  const SignUpCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: "HOME ALONE"),
        body: Container(
          padding: EdgeInsets.all(16),
            child: Center(
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: small_gap,),
                  const Logo(title: "회원 가입 완료",),
                  const SizedBox(height: large_gap,),
                  const Text("축하합니다! \n 회원 가입이 완료되었습니다!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  const SizedBox(height: large_gap,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      NavigationButton(buttonText: "로그인", route:"/sign-in"),
                      SizedBox(width: small_gap,),
                      NavigationButton(buttonText: "홈화면", route:"/home"),
                    ],
                  )
                ],
              )
            )
        ),
    );
  }
}