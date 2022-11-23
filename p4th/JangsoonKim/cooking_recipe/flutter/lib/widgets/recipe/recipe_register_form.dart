import 'dart:io';

import 'package:demo/utilities/spring_recipe_api.dart';
import 'package:demo/widgets/custom_dropdown.dart';
import 'package:demo/widgets/recipe/recipe_content_field.dart';
import 'package:demo/widgets/recipe/recipe_title_field.dart';
import 'package:demo/widgets/rounded_button.dart';
import 'package:demo/widgets/screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_theme.dart';
import 'images_register_form.dart';

class RecipeRegisterForm extends StatefulWidget {
  const RecipeRegisterForm({Key? key}) : super(key: key);

  @override
  State<RecipeRegisterForm> createState() => RecipeRegisterFormState();
}

class RecipeRegisterFormState extends State<RecipeRegisterForm> {
  static String category = '한식';
  static List<XFile>? selectedImages = [];
  String title = '';
  String content = '';
  String nickname = '';
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    selectedImages = [];
    super.initState();
    asyncMethod();
  }

  asyncMethod() async{
    var any = await SharedPreferences.getInstance();
    setState(() {
      nickname = any.getString("userNickname") ?? "없다";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
        child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    //이미지 업로드 폼
                    const ImagesRegisterForm(),
                    //글 제목 입력
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: RecipeTitleField(),
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
                    const RecipeContentField(),
                    const Divider(
                      color: Colors.black,
                    ),
                    RoundedButton(
                        text: "레시피 등록",
                        onPressed: () async {
                      if (_formKey.currentState!.validate()&& selectedImages!.isNotEmpty) {
                        Future<void> future =
                        SpringRecipeApi().uploadRecipe(selectedImages!, RecipeUploadRequest(title, category, content, nickname));
                        future.then((value) {
                          print("업로드 실패");
                          _showFailDialog(title: "업로드 실패", content: "게시물 업로드에 실패했습니다.");
                        }).catchError((error) {
                          print("업로드 성공");
                          _showSuccessDialog(title: "업로드 성공", content: "게시물 업로드에 성공했습니다.");
                        });

                      }
                      for (int i = 0; i < selectedImages!.length; i++) {
                        print(Image.file(File(selectedImages![i].path)));

                      }
                    }, color: AppTheme.nearlygrey, textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  static getCategory(String selectedVal) {
    category = selectedVal;
  }

  static getSelectedImages(List<XFile>? images) {
    selectedImages = images;
  }
  void _showFailDialog({String? title, String? content}){
    showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: Text(title!),
        content: Text(content!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text("확인"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }

  void _showSuccessDialog({String? title, String? content}){
    showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: Text(title!),
        content: Text(content!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text("확인"),
            onPressed: (){
              Get.off(const ScreenController());
            },
          )
        ],
      );
    });
  }

}
