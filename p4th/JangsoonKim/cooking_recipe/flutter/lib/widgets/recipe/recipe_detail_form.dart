import 'package:demo/screens/recipe/recipe_modify_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utilities/spring_recipe_api.dart';
import '../screen_controller.dart';

class RecipeDetailForm extends StatefulWidget {
  final dynamic recipe;
  final List<dynamic> imageList;
  List<String> tmpList = [];

  RecipeDetailForm({Key? key, required this.recipe, required this.imageList})
      : super(key: key);

  @override
  State<RecipeDetailForm> createState() => _RecipeDetailFormState();
}

class _RecipeDetailFormState extends State<RecipeDetailForm> {
  List<Widget> carouseImages = [];

  //bool _like = false;
  int _current = 0;
  double _rate = 0.0;
  bool tmp = false;
  String nickname = '';

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      asyncMethod();
    });
    super.initState();
    //_like = widget.recipe.like;
    _rate = widget.recipe.rating;

    for (var i = 0; i < widget.imageList.length; i++) {
      carouseImages!.add(Image.asset(
          "assets/images/uploadImgs/${widget.imageList[i].imagePath}"));
      widget.tmpList!
          .add("assets/images/uploadImgs/${widget.imageList[i].imagePath}");
    }
  }

  asyncMethod() async {
    var any = await SharedPreferences.getInstance();
    setState(() {
      nickname = any.getString("userNickname") ?? "없다";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: size.width,
                        enlargeCenterPage: true,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        reverse: false,
                        autoPlay: false,
                      ),
                      items: widget.tmpList.map((name) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              name,
                              width: size.width,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(carouseImages.length, (index) {
                          return Container(
                            width: 8,
                            height: 10,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    /*TextButton(
                      onPressed: () {
                        print(widget.recipe.images);
                      },
                      child: Text("출력"),
                    )*/
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Expanded(
                        child: Text(
                          widget.recipe.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(flex: 1),
                      /*_like*/ tmp == true
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  /*_like*/ tmp = false;
                                });
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  /*_like*/ tmp = true;
                                });
                              },
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.redAccent,
                                size: 30,
                              ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        widget.recipe.category,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    _rate == 0
                        ? Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "레시피를 평가해주세요",
                                  style: TextStyle(color: Colors.red),
                                )),
                          )
                        : Row(
                            children: [
                              Text(
                                "${_rate}",
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                      size: 33,
                                    )),
                              ),
                            ],
                          )
                  ],
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.grey.withOpacity(0.3),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 20, bottom: 15),
                  child: Row(
                    children: [
                      Column(children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/icons/profile.png"),
                          backgroundColor: Colors.white,
                        ),
                        Text(widget.recipe.writer,
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: size.height * 0.03,
                        )
                      ]),
                      Spacer(
                        flex: 1,
                      ),
                      Column(
                        children: [
                          nickname == widget.recipe.writer
                              ? Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.to(RecipeModifyScreen(
                                            tmpList: widget.tmpList,
                                            carouseImages: carouseImages,
                                            recipe: widget.recipe,
                                          ));
                                        },
                                        child: const Text(
                                          "수정",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Future<void> future =
                                              SpringRecipeApi().recipeDelete(
                                                  widget.recipe.recipeNo);
                                          future.then((value) {
                                            print("레시피 삭제 성공");
                                            _showDeleteSuccessDialog(
                                                title: "성공",
                                                content: "레시피 삭제 성공했습니다.",
                                                buttonText: "확인");
                                          }).catchError((error) {
                                            print("레시피 삭제 실패");
                                            _showDeleteFailDialog(
                                                title: "실패",
                                                content: "레시피 삭제 실패했습니다. 통신상태를 확인해주세요.",
                                                buttonText: "확인");
                                          });
                                        },
                                        child: const Text("삭제",
                                            style:
                                                TextStyle(color: Colors.grey)))
                                  ],
                                )
                              : Text(''),
                          Text(
                            widget.recipe.regDate,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.grey.withOpacity(0.3),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 20, bottom: 15),
                  child: Row(
                    children: const [
                      Text(
                        '조리 순서',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: 0.27,
                            color: AppTheme.indiaInk),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 20, bottom: 15),
                  child: Text(
                    widget.recipe.content,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _showDeleteFailDialog(
      {String? title, String? content, String? buttonText}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(content!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(buttonText!),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void _showDeleteSuccessDialog(
      {String? title, String? content, String? buttonText}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(content!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(buttonText!),
                onPressed: () {
                  Get.off(ScreenController());
                },
              )
            ],
          );
        });
  }
}
