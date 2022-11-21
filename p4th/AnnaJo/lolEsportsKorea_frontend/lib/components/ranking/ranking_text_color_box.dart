import 'package:flutter/material.dart';

class RankingTextColorBox extends StatelessWidget {
  const RankingTextColorBox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 20,
      child: ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: null,
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff23124b),
          padding: const EdgeInsets.all(1.0),
        ),
      ),
    );
  }
}
