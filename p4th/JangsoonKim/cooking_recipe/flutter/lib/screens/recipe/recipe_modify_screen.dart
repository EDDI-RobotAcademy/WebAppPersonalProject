import 'package:demo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../widgets/recipe/recipe_modify_form.dart';

class RecipeModifyScreen extends StatelessWidget {

  final dynamic recipe;
  final List<String> tmpList;
  final List<Widget> carouseImages;

  const RecipeModifyScreen({Key? key, required this.tmpList, required this.carouseImages, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("레시피 수정"),
      body: RecipeModifyForm(
        tmpList: tmpList,
        carouseImages: carouseImages,
        recipe: recipe,
      ),
    );
  }
}
