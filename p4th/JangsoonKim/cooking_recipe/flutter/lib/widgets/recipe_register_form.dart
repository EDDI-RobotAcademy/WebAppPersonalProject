import 'package:flutter/material.dart';

class RecipeRegisterForm extends StatefulWidget {
  const RecipeRegisterForm({Key? key}) : super(key: key);

  @override
  State<RecipeRegisterForm> createState() => _RecipeRegisterFormState();
}

class _RecipeRegisterFormState extends State<RecipeRegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: const <Widget>[
        Text('레시피 작성폼')
      ],
    ));
  }
}
