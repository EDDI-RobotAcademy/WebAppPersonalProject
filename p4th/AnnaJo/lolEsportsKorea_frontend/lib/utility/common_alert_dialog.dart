import 'package:flutter/material.dart';

class CommonAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onCustomButtonPressed;

  CommonAlertDialog(
      {required this.title,
      required this.content,
      required this.onCustomButtonPressed,
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            onCustomButtonPressed.call();
          },
        ),
      ],
      elevation: 20,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      contentTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
      backgroundColor: Colors.black54,
    );
  }
}
