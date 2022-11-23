import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../screens/recipe/recipe_detail_screen.dart';
import '../utilities/spring_recipe_api.dart';

class AllCategoryForm extends StatefulWidget {
  const AllCategoryForm({Key? key}) : super(key: key);

  @override
  State<AllCategoryForm> createState() => _AllCategoryFormState();
}

class _AllCategoryFormState extends State<AllCategoryForm> {

  String _categoryName = '';
  List<dynamic>? recipes = [];
  late Future<dynamic> _future;
  String _categoryLeadTxt = "레시피";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getAllRecipe();
  }

  Future getAllRecipe() async {
    await SpringRecipeApi().recipeList().then((recipeList) {
      setState(() {
        recipes = recipeList;
      });
    });
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              List<dynamic> results = [];
              for (dynamic recipe in recipes!) {
                if (recipe.category.toString().contains(_categoryName)) {
                  results!.add(recipe);
                }
              }
              return _buildResultList(results);
            }
          } else {
            return const Text("망");
          }
        }));
  }

  Widget _buildResultList(List<dynamic> searchResults) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: searchResults!.map((recipe) {
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
                                    builder: (context) => RecipeDetailScreen(
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
          ],
        ));
  }

  Widget _categoryButton(String category) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 35,
      decoration: BoxDecoration(
          color: AppTheme.nearlygrey, borderRadius: BorderRadius.circular(29)),
      child: TextButton(
          onPressed: (){
            setState(() {
              if(category == "전체"){
                _categoryName = "";
              } else if(category == "한식"){
                _categoryName = "한식";
              }else if(category == "양식"){
                _categoryName = "양식";
              }else if(category == "중식"){
                _categoryName = "중식";
              }else if(category == "일식"){
                _categoryName = "일식";
              }else{
                _categoryName = "기타";
              }
            });
            (_categoryName == "")?_categoryLeadTxt = "모든 레시피": _categoryLeadTxt = " 레시피";
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.blueAccent,
          ),
          child: Text(
            category,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: AppTheme.natureWhite,
              padding: const EdgeInsets.fromLTRB(10, 20, 5, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _categoryButton(
                        "전체"),
                    _categoryButton(
                        "한식"),
                    _categoryButton("양식"),
                    _categoryButton("중식"),
                    _categoryButton("일식"),
                    _categoryButton("기타"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,15,20,15),
              child: Text(
                _categoryName+_categoryLeadTxt,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: AppTheme.indiaInk),
              ),
            ),
            _buildBody(context)
          ],
        ),
      ]),
    );
  }
}
