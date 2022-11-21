import 'package:flutter/material.dart';

class TeamMiddleBar extends StatelessWidget {
  const TeamMiddleBar({Key? key, required this.title, required this.onCustomButtonPressed}) : super(key: key);

  final String title;
  final VoidCallback onCustomButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
                onCustomButtonPressed.call();
          },
          child: Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
