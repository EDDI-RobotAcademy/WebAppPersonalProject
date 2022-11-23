import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:look_style/api/board_spring_api.dart';
import 'package:look_style/components/board/borad_modify_form.dart';
import 'package:look_style/pages/board_read_page.dart';

class BoardModifyPage extends StatefulWidget {
  const BoardModifyPage({Key? key, required this.nickname, required this.boardType, required this.boardNo, required this.boardTitle, required this.boardContent, required this.regDate}) : super(key: key);

  final String? nickname;
  final String? boardType;
  final int? boardNo;
  final String? boardTitle;
  final String? boardContent;
  final String? regDate;

  @override
  State<BoardModifyPage> createState() => _BoardModifyPageState();
}

class _BoardModifyPageState extends State<BoardModifyPage> {

  final _formKey = GlobalKey<FormState>();
  var titleController;
  var contentController;

  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImages = [];

  void _pickImage() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        _pickedImages = images;
        if (_pickedImages.isNotEmpty) {
          setState(() {
            checkImageExistence = false;
          });
        }
      });
    }
  }

  var imageNameList;
  var list = [];
  List<int> imageNo = [];

  bool checkImageExistence = false;

  void getImageName() {
    imageNameList.then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          list.add(value[i].imageName);
          imageNo.add(value[i].imageNo);
          if (value[i].imageName != null) {
            checkImageExistence = true;
          }
        });
      }
    });
  }

  @override
  void initState() {
    imageNameList = BoardSpringApi().requestBoardImage(widget.boardNo!);
    getImageName();
    titleController = TextEditingController(text: '${widget.boardTitle}');
    contentController = TextEditingController(text: '${widget.boardContent}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    Expanded(child: Text(widget.nickname!)),
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
              BoardModifyForm(formKey: _formKey, titleController: titleController, contentController: contentController, boardNo: widget.boardNo!,),
              SizedBox(height: 10),
              Container(
                height: 150,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: checkImageExistence ? ListView.builder(
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/${list[index]}')),
                          ),
                      );
                    })
                    : ListView.builder(
                    itemCount: _pickedImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover, image: FileImage(File(_pickedImages[index].path))),
                          ));
                    })
              ),
              SizedBox(height: 100)
            ],
          )
      ),
      bottomSheet: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            if (_pickedImages.isNotEmpty) {
              var success = BoardSpringApi().boardModify(BoardModifyInfo(
                  widget.boardNo!,titleController.text, contentController.text, widget.nickname!,
                  widget.boardType!, widget.regDate!), _pickedImages, imageNo);
              success.then((value) {
                if (value != null) {
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
                              "게시물이 성공적으로 수정되었습니다.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.offAll(BoardReadPage(boardNo: value));
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
                              "게시물 수정에 실패하였습니다...",
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
              var success = BoardSpringApi().boardModifyWithoutImage(BoardModifyInfo(widget.boardNo!,titleController.text, contentController.text, widget.nickname!, widget.boardType!, widget.regDate!));
              success.then((value) {
                if (value != null) {
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
                              "게시물이 성공적으로 수정되었습니다.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.offAll(BoardReadPage(boardNo: value));
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
                              "게시물 수정에 실패하였습니다...",
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
          child: Center(child: Text('게시물 수정', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
