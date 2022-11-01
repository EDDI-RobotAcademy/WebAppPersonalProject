import 'package:flutter/material.dart';

class SnsIcon extends StatelessWidget {
  final String iconSrc;
  final VoidCallback press;

  const SnsIcon({Key? key, required this.iconSrc, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(shape: BoxShape.rectangle),
          child: Image.asset(
            iconSrc,
            height: 45,
            width: 45,
          ),
        ),
      ),
    );
  }
}
