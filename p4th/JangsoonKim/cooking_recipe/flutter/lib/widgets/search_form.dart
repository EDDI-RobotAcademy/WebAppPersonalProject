import 'package:demo/app_theme.dart';
import 'package:flutter/material.dart';

import '../screens/recipe/recipe_detail_screen.dart';
import '../utilities/spring_recipe_api.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = '';
  List<dynamic>? recipes = [];
  late Future<dynamic> _future;



  _SearchFormState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
        print(_searchText);
      });
    });
  }

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
              List<dynamic> searchResults = [];
              for (dynamic recipe in recipes!) {
                if (recipe.keyword.toString().contains(_searchText)) {
                  searchResults!.add(recipe);
                  for (dynamic s in searchResults) {
                    print(s.keyword);
                  }
                }
              }
              return _buildResultList(searchResults);

            }
          } else {
            return const Text("망");
          }
        }));
  }

  Widget _buildResultList(List<dynamic> searchResults){
    Size size = MediaQuery.of(context).size;
    return  Container(
        padding: EdgeInsets.all(7),
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
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        Column(
          children: <Widget>[
            Container(
              color: AppTheme.natureWhite,
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 6,
                      child: TextField(
                        focusNode: focusNode,
                        style: const TextStyle(fontSize: 15),
                        autofocus: true,
                        controller: _filter,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            ),
                            suffixIcon: focusNode.hasFocus
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _filter.clear();
                                        _searchText = '';
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.black54,
                                      size: 20,
                                    ))
                                : Container(),
                            hintText: "레시피 검색",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      )),
                  focusNode.hasFocus
                      ? Expanded(
                          child: TextButton(
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = '';
                              focusNode.unfocus();
                            });
                          },
                          child: const Text(
                            '취소',
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                      : Expanded(flex: 0, child: Container())
                ],
              ),
            ),
            _buildBody(context)
          ],
        ),
      ]),
    );
  }
}
