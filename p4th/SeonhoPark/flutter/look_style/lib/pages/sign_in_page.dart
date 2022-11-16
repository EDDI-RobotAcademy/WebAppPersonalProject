import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:look_style/components/signIn/sign_in_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String? userToken;
  String? userEmail;
  String? userNickname;
  static final storage = FlutterSecureStorage();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _signIn();
    });
    super.initState();
  }

  _signIn() async {
    userToken = await storage.read(key: 'userToken');
    userEmail = await storage.read(key: 'userEmail');
    userNickname = await storage.read(key: 'userNickname');
    print(userToken);
    print(userEmail);
    print(userNickname);

    if(userToken != null) {
      Get.offNamed('/main', arguments: [userEmail, userNickname]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/logo.png' ,width: 300, height: 300,),
                // Text("Look Style", style: TextStyle(fontSize: 40, fontFamily: "bazzi")),
                SignInFormField(storage: storage,),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(height: 40, thickness: 1, indent: 30, endIndent: 10,)
                    ),
                    Text("OR", /*style: TextStyle(fontFamily: 'jua'),*/),
                    Expanded(
                        child: Divider(height: 40, thickness: 1, indent: 10, endIndent: 30,)
                    ),
                  ],
                ),
                // SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("처음 이용하시나요 ?", style: TextStyle(fontSize: 15),),
                    // SizedBox(width: 10,),
                    TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Get.toNamed('/sign-up');
                        },
                        child: Text("회원가입"),
                    )
                  ],
                ),
                // RouteButton(name: "회원가입", route: "/sign-up", width: 250, height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
