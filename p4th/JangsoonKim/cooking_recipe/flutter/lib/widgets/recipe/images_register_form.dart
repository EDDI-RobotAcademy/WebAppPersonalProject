import 'dart:io';

import 'package:demo/widgets/recipe/recipe_register_form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_theme.dart';

class ImagesRegisterForm extends StatefulWidget {
  const ImagesRegisterForm({Key? key}) : super(key: key);

  @override
  State<ImagesRegisterForm> createState() => _ImagesRegisterFormState();
}

class _ImagesRegisterFormState extends State<ImagesRegisterForm> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles = [];

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {
          RecipeRegisterFormState.getSelectedImages(imagefiles);
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(width: 0.8)),
                child: SizedBox.fromSize(
                  size: const Size(70, 70),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: openImages,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.camera_alt_outlined),
                            Text("${imagefiles!.length}/8")
                          ],
                        ),
                      ),
                    ),
                  ),
                ))),
        const Divider(
          color: AppTheme.indiaInk,
        ),
        const Text("선택된 이미지"),
        Divider(),
        imagefiles != null
            ? Wrap(
                children: imagefiles!.map((imageone) {
                  return Container(
                      child: Card(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.file(File(imageone.path)),
                    ),
                  ));
                }).toList(),
              )
            : Container(),
        const Divider(
          color: AppTheme.indiaInk,
        ),
    /*    TextButton(
            onPressed: () {
              for (int i = 0; i < imagefiles!.length; i++) {
                print(Image.file(File(imagefiles![i].path)));
              }
            },
            child: Text("path"))*/
      ],
    );
  }
}
