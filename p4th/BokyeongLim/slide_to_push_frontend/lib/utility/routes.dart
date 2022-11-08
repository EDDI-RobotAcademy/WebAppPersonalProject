import 'package:flutter/cupertino.dart';
import 'package:slide_to_push_frontend/view/my_todo_view.dart';
import 'package:slide_to_push_frontend/view/register_todo_view.dart';
import 'package:slide_to_push_frontend/view/sign_in_view.dart';
import 'package:slide_to_push_frontend/view/sign_up_view.dart';


// import '../view/test_view.dart';

class Routes {
  Routes._();

  // static const String testView = '/test_home_view';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String myTodo = '/todos-main';
  static const String registerTodo = '/register';

  static final routes = <String, WidgetBuilder>{
    // testView: (BuildContext context) => TestPage(),
    signIn: (BuildContext context) => SignInView(),
    signUp: (BuildContext context) => SignUpView(),
    myTodo: (BuildContext context) => MyTodoView(),
    registerTodo: (BuildContext context) => RegisterTodoView(),
  };
}