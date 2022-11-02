import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({
    Key? key,
    required this.name,
    required this.route,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String name;
  final String route;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        primary: Colors.grey
      ),
      onPressed: () {
        Get.toNamed('$route');
      },
      child: Text(name),
    );
  }
}
