import 'package:flutter/material.dart';
import 'package:lol_esports_korea_app/components/authentication/custom_form.dart';

import '../../components/app_bar/common_top_app_bar.dart';
import '../../utility/size.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: CommonTopAppBar(
        title: const Text('MEMBER LOGIN'),
        appBar: AppBar(),
      ),
      body: Form(
          child : Column(
            children: <Widget>[
              Padding(
          padding: const EdgeInsets.all(16.0),
              child: ListView(
                shrinkWrap: true,
                children: const [
                  Icon(
                    Icons.account_circle,
                    size:xxlarge_gap,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    height: large_gap,
                  ),
                  CustomForm(),
                SizedBox(
                  height: xlarge_gap
                ),
                ],
              ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text('Not a member?'),
                    const SizedBox(
                      width: small_gap,
                    ),
                    TextButton(
                        onPressed:
                        () {
                          Navigator.pushNamed(context, "/signUp");
                        },
                        child: const Text("Create account",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold
                        ),)),
                  ],
              ),
            ],
          ),
      ),
    );
  }
}
