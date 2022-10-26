import 'package:flutter/material.dart';
import 'package:slide_to_push_frontend/utility/size.dart';
import 'package:slide_to_push_frontend/utility/color.dart';
import '../utility/input_validate.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(
                color:Style.mainBlack, width: 6.0, style: BorderStyle.solid)
              ),
            child: new Form(
              key: formkey,
              child: Column(
                children: [
                  _textFieldForEmail(),
                  SizedBox(height: medium_gap,),
                  _textFieldForPassword(),
                  SizedBox(height: large_gap,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){}, child: Text('SIGN UP')),
                      TextButton(onPressed: (){}, child: Text('FORGOT PASSWORD')),
                    ],
                  ),
                  SizedBox(height: large_gap,),
                  _submitButton()
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget _textFieldForEmail(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'email을 입력해주세요.',
        enabledBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
        focusedBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
        errorBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
        focusedErrorBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      focusNode:_emailFocus,
      validator: (value) => CheckValidate().validateEmail(_emailFocus, value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _textFieldForPassword(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'password를 입력해주세요.',
        enabledBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
        focusedBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
        errorBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
        focusedErrorBorder:
        OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            gapPadding: 3.0,
            borderSide: BorderSide( width : 4, color : Style.mainBlack)
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      focusNode:_passwordFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => CheckValidate().validatePassword(_passwordFocus, value!),
      obscureText: true,
    );
  }

  InputDecoration _textFormDecoration(hintText, helperText){
    return new InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(0, 4, 0, 8),
      hintText: hintText,
      helperText: helperText,
    );
  }

  Widget _submitButton(){
    return ElevatedButton(
      onPressed: (){

      },
      child: Text("SIGN IN", style: TextStyle(color: Colors.white),),
      style: ElevatedButton.styleFrom(
        primary: Style.mainBlack,
        onPrimary: Colors.black,
        minimumSize: Size(400, 60),
        shape: BeveledRectangleBorder(),
      ),
    );
  }

}
