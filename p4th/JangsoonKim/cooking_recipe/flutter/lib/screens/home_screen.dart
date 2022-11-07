import 'package:demo/screens/recipe_screen.dart';
import 'package:demo/widgets/authentication/login_form.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Color(0xFFFFFFFF), //테마분류 필요
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            foregroundColor: Colors.black,
            title: Text('EZ.COOK'),
            centerTitle: false,
          ),
          endDrawer: CustomDrawer(),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.03,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                    height: size.height,
                    child: HotRecipeListView(
                      callBack: () {
                        moveTo();
                      },
                    )),
              ))
            ],
          ),
        ));
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => RecipeScreen(),
      ),
    );
  }
}
