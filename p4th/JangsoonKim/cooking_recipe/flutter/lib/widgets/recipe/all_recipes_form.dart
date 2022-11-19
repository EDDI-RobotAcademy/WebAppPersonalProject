import 'package:demo/screens/recipe_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../model/tmp_recipe.dart';

class AllRecipesForm extends StatelessWidget {
  const AllRecipesForm({Key? key, required this.recipes}) : super(key: key);

  final List<Recipe>? recipes;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
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
                            width: size.width *0.4,
                              height: size.height *0.33,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19)
                                ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RecipeDetailScreen(recipe: recipe)),
                                );
                              },
                              child: Column(
                                children: [
                                    Container(
                                      height: size.height * 0.24,
                                      width: size.width * 0.4,
                                      child: Image.asset(recipe.images[0]),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Text(recipe.title, style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      letterSpacing: 0.5,
                                      color: AppTheme.indiaInk
                                    ),),
                                  )
                                ],
                              ),
                            ),
                          )),
                        );
                      }).toList(),
                    ),
                )
                : Container(),
          ],
        ));
  }

/*  List<Widget>? makeImages(List<Recipe> recipes) {
    List<Widget> results = [];
    for (var i = 0; i < recipes.length; i++) {
      results.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<Nulll>(
            fullscreenDialog: true,
            builder: (BuildContext context){
              return RecipeDetailForm(

              )
            }
          ))
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('images/' + recipes[i].thumbnail),
          ),
        ),
      ));
    }
    return results;
  }*/
}
