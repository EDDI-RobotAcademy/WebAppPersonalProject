import 'dart:io';

import 'package:demo/utilities/spring_upload_api.dart';
import 'package:demo/widgets/custom_dropdown.dart';
import 'package:demo/widgets/recipe/recipe_content_field.dart';
import 'package:demo/widgets/recipe/recipe_title_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilities/check_validate.dart';
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
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    selectedImages = [];
    super.initState();
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
            child: Container(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    //이미지 업로드 폼
                    ImagesRegisterForm(),
                    //글 제목 입력
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RecipeTitleField(),
                    ),
                    Row(
                      children: [
                        //카테고리 선택
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 3),
                          child: Text(
                            "카테고리 선택",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: CustomDropdownPage()),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    //레시피 본문
                    RecipeContentField(),
                    TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print(title);
                            print(content);
                            print(category);

                          }
                          for (int i = 0; i < selectedImages!.length; i++) {
                                print(Image.file(File(selectedImages![i].path)));
                                Future<void> future =
                                SpringUploadApi().uploadFiles(selectedImages!);
                              }
                        },
                        child: Text("등록"))
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
}
