import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/utilities/spring_recipe_api.dart';
import 'package:demo/widgets/recipe/content_editing_controller.dart';
import 'package:demo/widgets/recipe/recipe_content_field.dart';
import 'package:demo/widgets/recipe/recipe_title_field.dart';
import 'package:demo/widgets/recipe/title_editing_controller.dart';
import 'package:demo/widgets/screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';
import '../custom_dropdown.dart';
import '../rounded_button.dart';

class RecipeModifyForm extends StatefulWidget {
  final dynamic recipe;
  final List<String> tmpList;
  final List<Widget> carouseImages;

  const RecipeModifyForm(
      {Key? key,
      required this.tmpList,
      required this.carouseImages,
      required this.recipe})
      : super(key: key);

  @override
  State<RecipeModifyForm> createState() => RecipeModifyFormState();
}

class RecipeModifyFormState extends State<RecipeModifyForm> {
  static String category = '한식';
  String title = '';
  String content = '';
  int _current = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: ListView(children: [
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
                      children:
                          List.generate(widget.carouseImages.length, (index) {
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
              SingleChildScrollView(
                child: SizedBox(
                  height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        //글 제목 입력
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TitleEditingController(
                            titleText: widget.recipe.title,
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            //카테고리 선택
                            const Padding(
                              padding: EdgeInsets.only(left: 10, top: 3),
                              child: Text(
                                "카테고리 선택",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.25,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: CustomDropdownPage()),
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        //레시피 본문
                        ContentEditingController(
                            contentText: widget.recipe.content),
                        const Divider(
                          color: Colors.black,
                        ),
                        RoundedButton(
                            text: "레시피 수정",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Future<void> future = SpringRecipeApi()
                                    .recipeModify(ModifyRequest(
                                        recipeNo: widget.recipe.recipeNo,
                                        title: title,
                                        category: category,
                                        content: content));
                                future.then((value) {
                                  print("레시피 수정 성공");
                                  _showModifySuccessDialog(
                                      title: "성공",
                                      content: "레시피 수정에 성공했습니다.",
                                      buttonText: "확인");
                                }).catchError((error) {
                                  print("레시피 수정 실패");
                                  _showModifyFailDialog(
                                      title: "실패",
                                      content: "레시피 수정에 실패했습니다. 통신상태를 확인해주세요.",
                                      buttonText: "확인");
                                });
                              }
                            },
                            color: AppTheme.nearlygrey,
                            textColor: Colors.black)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }

  static getCategoryForModify(String selectedVal) {
    category = selectedVal;
  }

  void _showModifyFailDialog(
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

  void _showModifySuccessDialog(
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
