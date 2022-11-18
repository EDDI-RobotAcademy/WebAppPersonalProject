import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/friend_drawer.dart';
import '../component/navi_menu.dart';
import '../component/sign_in_form.dart';
import '../component/sign_up_first_form.dart';
import '../utility/style/common_size.dart';
import '../utility/style/common_text_style.dart';

class SignInView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      endDrawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87,),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                icon: Icon(Icons.person, color: Colors.black87,),
                onPressed: () {Scaffold.of(context).openEndDrawer(); });
          })
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MenuDrawer(),
      endDrawer: FriendsDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: xlarge_size),
              Text('Sign In', style: headerText(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('아직 가입하지 않으셨다면', style: defaultText(),),
                  const SizedBox(width:3),
                  TextButton(
                    child: const Text('Sign Up', style: TextStyle(fontSize: 20,),),
                    onPressed: (){Get.to(() => SignUpFirstForm());}, )
                ]
              ),
              const SizedBox(height: large_size),
              const SignInForm()
            ],
          ),
        ),
      ),
    );
  }
}
