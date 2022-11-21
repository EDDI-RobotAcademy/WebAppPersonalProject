import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:look_style/api/board_spring_api.dart';
import 'package:look_style/components/board/borad_register_form.dart';

class BoardRegisterPage extends StatefulWidget {
  const BoardRegisterPage({Key? key, required this.nickname, required this.boardType}) : super(key: key);

  final String nickname;
  final String boardType;

  @override
  State<BoardRegisterPage> createState() => _BoardRegisterPageState();
}

class _BoardRegisterPageState extends State<BoardRegisterPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImages = [];

  void _pickImage() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _pickedImages = images;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed('/main');
          },
          icon: Icon(Icons.close),
        ),
        title: Text('${widget.boardType} 게시물 등록', style: TextStyle(color: Colors.black, fontSize: 18),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text(widget.nickname)),
                    IconButton(
                        onPressed: _pickImage,
                        icon: Icon(
                          Icons.collections,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Divider(
                height: 5,
                indent: 10,
                endIndent: 10,
                thickness: 1,
              ),
              SizedBox(height: 10),
              BoardRegisterForm(formKey: _formKey, titleController: titleController, contentController: contentController),
              SizedBox(height: 10),
              Container(
                height: 150,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                    itemCount: _pickedImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover, image: FileImage(File(_pickedImages[index].path))),
                          ));
                    }
                ),
              ),
              SizedBox(height: 100)
            ],
          )
      ),
      bottomSheet: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            if (_pickedImages != null) {
              var success = BoardSpringApi().boardRegister(Board(
                  titleController.text, contentController.text, widget.nickname,
                  widget.boardType), _pickedImages);
              success.then((value) {
                if (value == true) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text('Look Style',
                            style: TextStyle(fontFamily: 'bazzi'),)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius
                                  .circular(20)),
                          content: Container(
                            width: 300,
                            height: 100,
                            child: Text(
                              "게시물이 성공적으로 등록되었습니다.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.offAllNamed('/main');
                                // Get.offAllNamed('/main');
                              },
                              child: Text(
                                "확인", style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        );
                      }
                  );
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text('Look Style',
                            style: TextStyle(fontFamily: 'bazzi'),)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius
                                  .circular(20)),
                          content: Container(
                            width: 300,
                            height: 100,
                            child: Text(
                              "게시물 등록에 실패하였습니다...",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "확인", style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        );
                      }
                  );
                }
              });
            } else {
              var success = BoardSpringApi().boardRegisterWithoutImage(Board(titleController.text, contentController.text, widget.nickname, widget.boardType));
              success.then((value) {
                if (value == true) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text('Look Style',
                            style: TextStyle(fontFamily: 'bazzi'),)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius
                                  .circular(20)),
                          content: Container(
                            width: 300,
                            height: 100,
                            child: Text(
                              "게시물이 성공적으로 등록되었습니다.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.offAllNamed('/main');
                                // Get.offAllNamed('/main');
                              },
                              child: Text(
                                "확인", style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        );
                      }
                  );
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text('Look Style',
                            style: TextStyle(fontFamily: 'bazzi'),)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius
                                  .circular(20)),
                          content: Container(
                            width: 300,
                            height: 100,
                            child: Text(
                              "게시물 등록에 실패하였습니다...",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "확인", style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        );
                      }
                  );
                }
              });
            }
          }
        },
        child: Container(
          color: Colors.black87,
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Text('게시물 등록', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
