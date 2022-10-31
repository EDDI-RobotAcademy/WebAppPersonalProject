import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(image: AssetImage("assets/tmp_logo.png"), height: 100, width: 100,),
        Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
      ],
    );
  }
}