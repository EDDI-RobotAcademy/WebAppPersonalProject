import 'package:demo/screens/recipe/recipe_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class AllRecipesForm extends StatefulWidget {
  final List<dynamic>? recipeList;

  const AllRecipesForm({Key? key, this.recipeList}) : super(key: key);

  @override
  State<AllRecipesForm> createState() => _AllRecipesFormState();
}

class _AllRecipesFormState extends State<AllRecipesForm> {
  List<dynamic>? recipes;

  @override
  void initState() {
    // TODO: implement initState
    recipes = widget.recipeList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '모든 레시피',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  letterSpacing: 0.27,
                  color: AppTheme.indiaInk),
            ),
            recipes != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: recipes!.map((recipe) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Container(
                              width: size.width * 0.4,
                              height: size.height * 0.33,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RecipeDetailScreen(
                                                  recipeNo: recipe.recipeNo,
                                                  recipe: recipe)),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size.height * 0.24,
                                        width: size.width * 0.4,
                                        child: Image.asset(
                                            "assets/images/uploadImgs/${recipe.thumbnail}"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: Text(
                                          recipe.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              letterSpacing: 0.5,
                                              color: AppTheme.indiaInk),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        );
                      }).toList(),
                    ),
                  )
                : Container(
                    child: Text("게시물 없음"),
                  ),
          ],
        ));
  }
}
