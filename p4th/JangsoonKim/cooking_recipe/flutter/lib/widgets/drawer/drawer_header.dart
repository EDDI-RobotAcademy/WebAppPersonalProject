import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              children: const [
                Text(
                  'soon',
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'test@test.com',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],),
          ],);
  }
}
