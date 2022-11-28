import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todos/component/sign_up_first_form.dart';

import '../view/sign_in_view.dart';
import '../controller/sign_up_controller.dart';
import '../component/sign_up_second_form.dart';
import '../utility/style/common_size.dart';
import '../utility/style/common_text_style.dart';
import 'custom_name_input.dart';
import 'custom_password_input.dart';

class SignUpLastForm extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
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
                    Text('사용하실 이름과 비밀번호를 입력해주세요.', style: defaultText(),),
                    SizedBox(height: xlarge_size),
                    CustomNameInput(controller: nameController,),
                    SizedBox(height: 30),
                    CustomPasswordInput(controller:passwordController ),
                    CustomPasswordInput(controller:checkPasswordController ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      child: ElevatedButton(
                          child: Text('가입'),
                          onPressed: () async {
                              bool? result;

                              if (passwordController.text == checkPasswordController.text) {
                               result = await signUpController.signUp(passwordController.text, checkPasswordController.text );
                              } else {
                                Get.snackbar(
                                  'FAILED',
                                  '비밀번호를 확인해주세요.',
                                  backgroundColor: Colors.white,
                                );
                                nameController.clear();
                                passwordController.clear();
                                checkPasswordController.clear();
                              }

                              if(result == true) {
                                Get.snackbar(
                                  'SUCCESS',
                                  '정상적으로 가입되었습니다.',
                                  backgroundColor: Colors.white,
                                );

                                Get.to(() => SignInView());
                              } else {
                                Get.snackbar(
                                  'FAILED',
                                  '가입에 실패하였습니다.',
                                  backgroundColor: Colors.white,
                                );
                              }
                          }
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        TextButton(onPressed: (){Get.off(() => SignUpSecondForm());}, child: Text('Back')) ,
                        TextButton(onPressed: (){Get.off(() => SignUpFirstForm());}, child: Text('To first')) ,
                      ],
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



