import 'package:demo/app_theme.dart';
import 'package:demo/utilities/spring_recipe_api.dart';
import 'package:demo/widgets/recipe/all_recipes_form.dart';
import 'package:demo/screens/recipe/recipe_screen.dart';
import 'package:demo/widgets/authentication/login_form.dart';
import 'package:demo/widgets/custom_appbar.dart';
import 'package:demo/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/hot/hot_recipe_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = LoginFormState().email;
  List<dynamic>? recipes = [];
  late Future<dynamic> _future;

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: AppTheme.natureWhite,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: customAppbar('EZ.COOK'),
          endDrawer: const CustomDrawer(),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.03,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                    height: size.height * 10.48,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HotRecipeListView(
                          callBack: () {
                            moveTo();
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                        FutureBuilder(
                            future: _future,
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(snapshot.error.toString()),
                                  );
                                } else {
                                  return AllRecipesForm(recipeList: recipes, text: "모든 레시피",);
                                }
                              } else{
                                return const Text("망");
                              }
                            })),
                      ],
                    )),
              )),
            ],
          ),
        ));
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const RecipeScreen(),
      ),
    );
  }
}
