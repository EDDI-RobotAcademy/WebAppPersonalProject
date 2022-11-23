import 'package:demo/widgets/drawer/custom_drawer.dart';
import 'package:demo/widgets/recipe/recipe_detail_form.dart';
import 'package:demo/widgets/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/spring_recipe_api.dart';

class RecipeDetailScreen extends StatefulWidget {
  final dynamic recipe;
  final int recipeNo;

  const RecipeDetailScreen(
      {Key? key, required this.recipe, required this.recipeNo})
      : super(key: key);

  @override
  State<RecipeDetailScreen> createState() => RecipeDetailScreenState();
}

class RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Future<dynamic> _future;
  late List<dynamic> imageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getImages();
  }

  Future getImages() async {
    await SpringRecipeApi().loadImages(widget.recipeNo).then((imgList) {
      setState(() {
        imageList = imgList!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          endDrawer: const CustomDrawer(),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: (){
                Get.offAll(() => const ScreenController());
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            foregroundColor: Colors.black,
            centerTitle: false,
          ),
          body: FutureBuilder(
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
                    return RecipeDetailForm(
                        imageList: imageList, recipe: widget.recipe);
                  }
                } else {
                  return const Text("망");
                }
              }))),
    );
  }
}
