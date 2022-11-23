import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawerHeader extends StatefulWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  State<CustomDrawerHeader> createState() => CustomDrawerHeaderState();

}

class CustomDrawerHeaderState extends State<CustomDrawerHeader> {

  static String email = "";
  static String nickname = "";

  @override
  void initState(){
    // TODO: implement initState
    Future.delayed(Duration.zero,()async{
      asyncMethod();
    });
    super.initState();
  }
  asyncMethod() async{
    var any = await SharedPreferences.getInstance();
    setState(() {
      email = any.getString("userEmail")??'없다';
      nickname = any.getString("userNickname") ?? "없다";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Row(
      children: [
        SizedBox(width: size.width * 0.04,),
        const CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage("assets/icons/profile.png"),
          backgroundColor: Colors.white,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nickname,
              style: const TextStyle(fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],),
      ],);
  }
}