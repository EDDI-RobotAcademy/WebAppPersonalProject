import 'package:demo/widgets/drawer/custom_drawer.dart';
import 'package:demo/widgets/recipe/recipe_detail_form.dart';
import 'package:flutter/material.dart';

import '../model/tmp_recipe.dart';

class RecipeDetailScreen extends StatefulWidget {

  final Recipe recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetailScreen> createState() => RecipeDetailScreenState();
}

class RecipeDetailScreenState extends State<RecipeDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
        centerTitle: false,
      ),
      body: RecipeDetailForm(
        recipe: widget.recipe,
      ),
    );
  }
}
