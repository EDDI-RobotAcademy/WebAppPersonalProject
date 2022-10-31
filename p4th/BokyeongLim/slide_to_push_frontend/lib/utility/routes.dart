import 'package:flutter/cupertino.dart';
import 'package:slide_to_push_frontend/view/sign_in_view.dart';
import 'package:slide_to_push_frontend/view/sign_up_view.dart';

class Routes {
  Routes._();

  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';

  static final routes = <String, WidgetBuilder>{
    signIn: (BuildContext context) => SignInView(),
    signUp: (BuildContext context) => SignUpView(),

  };
}