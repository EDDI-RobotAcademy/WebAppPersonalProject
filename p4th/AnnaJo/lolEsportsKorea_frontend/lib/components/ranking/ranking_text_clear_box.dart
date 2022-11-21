import 'package:flutter/material.dart';

class RankingTextClearBox extends StatelessWidget {
  const RankingTextClearBox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 20,
      child: ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        onPressed: null,
      ),
    );
  }
}
