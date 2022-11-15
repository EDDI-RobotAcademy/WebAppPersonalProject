import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_email_input.dart';
import '../controller/sign_up_controller.dart';
import '../component/sign_up_second_form.dart';
import '../utility/style/common_size.dart';
import '../utility/style/common_text_style.dart';

class SignUpFirstForm extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: xlarge_size),
              Text('Sign Up', style: headerText()),
              SizedBox(height: 10,),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사용하실 이메일을 입력해주세요.', style: defaultText(),),
                    SizedBox(height: xlarge_size),
                    CustomEmailInput(controller: emailController),
                    SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      child: ElevatedButton(
                          child: Text('Email 중복확인'),
                          onPressed: () async{
                            // test를 위해 일단 무조건 true로
                            bool result = await signUpController.checkDuplicatedEmail(emailController.text);

                            if (result) {
                              signUpController.saveEmail = emailController.text;
                              Get.snackbar(
                                'SUCCESS',
                                '사용할 수 있는 이메일입니다.',
                                backgroundColor: Colors.white,
                              );
                              signUpController.sendOTP(emailController.text);
                              Get.to(() => SignUpSecondForm());
                            } else {
                              Get.snackbar(
                                'FAILED',
                                '사용할 수 없는 이메일입니다.',
                                backgroundColor: Colors.white,
                              );
                              emailController.clear();
                            }
                          }
                      ),
                    )
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}

//controller로 옮기기



