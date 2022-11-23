import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => RecipeScreenState();
}


class RecipeScreenState extends State<RecipeScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('레시피 화면')
    );
  }
}
