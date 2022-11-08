import 'package:demo/screens/home_screen.dart';
import 'package:demo/widgets/recipe_register_form.dart';
import 'package:demo/widgets/screen_controller.dart';
import 'package:flutter/material.dart';

class RecipeRegisterScreen extends StatelessWidget {
  const RecipeRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ScreenController()));
            },
            icon: Icon(Icons.close)),
        foregroundColor: Colors.black,
        title: Text('레시피 작성'),
      ),
      body: RecipeRegisterForm(),
    );
  }
}
