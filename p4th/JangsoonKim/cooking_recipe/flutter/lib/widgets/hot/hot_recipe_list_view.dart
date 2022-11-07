import 'package:flutter/material.dart';

import '../../model/tmp_hot_recipe.dart';
import 'hot_recipe_view.dart';

class HotRecipeListView extends StatefulWidget {
  const HotRecipeListView({Key? key, this.callBack}) : super(key: key);

  final Function()? callBack;

  @override
  State<HotRecipeListView> createState() => _HotRecipeListViewState();
}

class _HotRecipeListViewState extends State<HotRecipeListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(
            top: 8, left: 18, right: 16),
          child: Text(
            '인기 레시피',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                letterSpacing: 0.27,
                color: Color(0xFF17262A)),
          ),),
        const SizedBox( height: 16,),
        Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Container(
                height: 134,
                width: double.infinity,
                child: FutureBuilder<bool>(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox();
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 16, left: 16),
                        itemCount: HotRecipe.hotRecipeList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final int count = HotRecipe.hotRecipeList.length > 10
                              ? 10
                              : HotRecipe.hotRecipeList.length;
                          final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: animationController!,
                                  curve: Interval((1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn)));
                          animationController?.forward();

                          return HotRecipeView(
                            hotRecipe: HotRecipe.hotRecipeList[index],
                            animation: animation,
                            animationController: animationController,
                            callback: widget.callBack,
                          );
                        },
                      );
                    }
                  },
                ))),
      ],
    );
  }
}