import 'package:demo/screens/authentication%20/login_screen.dart';
import 'package:demo/utilities/spring_api.dart';
import 'package:demo/widgets/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/intro_screen.dart';


bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark
            )
        ),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          //show ? const OnBoardingPage() : LoginScreen()
          future: SpringApi().tryAutoLogin(),
          builder: (context, authResult){
            if(authResult.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[100]!),
              );
            } else{
              if(authResult.data == true){
                return const ScreenController();
              }
              else{
                return show ? const OnBoardingPage() : const LoginScreen();
              }
            }
          },
        )
    );
  }
}

