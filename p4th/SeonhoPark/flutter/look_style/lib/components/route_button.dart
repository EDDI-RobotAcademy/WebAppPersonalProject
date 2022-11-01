import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({Key? key, required this.name ,required this.route}) : super(key: key);

  final String name;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.grey
      ),
      onPressed: () {
        Get.toNamed('$route');
      },
      child: Text(name),
    );
  }
}
