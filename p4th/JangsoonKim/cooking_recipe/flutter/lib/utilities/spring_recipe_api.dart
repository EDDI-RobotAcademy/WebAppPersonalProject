import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class SpringRecipeApi {
  static const String httpUrl = '172.30.1.3:7777';

  Future<void> uploadRecipe(
      List<XFile> images, RecipeUploadRequest request) async {
    final List<MultipartFile> _files = images
        .map((img) => MultipartFile.fromFileSync(img.path,
            contentType: MediaType("image", "jpg")))
        .toList();

    // 파일 경로를 통해 formData 생성
    var dio = Dio();
    var _formData = FormData.fromMap({
      'files': _files,
      'title': request.title,
      'category': request.category,
      'content': request.content,
      'writer': request.writer
    });

    print(request.title);
    // 업로드 요청
    dio.options.headers["authorization"];
    dio.options.contentType = 'multipart/form-data';

    var response =
        await dio.post('http://172.30.1.3:7777/recipe/upload', data: _formData);
    if (response.statusCode == 200) {
      return json.decode(response.data);
    } else {
      throw (false);
    }
  }

  Future<List<RequestRecipe>?> recipeList() async {
    var response = await http.get(Uri.http(httpUrl, '/recipe/list'),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      debugPrint("통신 확인");
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      print(jsonData);

      List<RequestRecipe> recipeList =
          jsonData.map((dataJson) => RequestRecipe.fromJson(dataJson)).toList();

      return recipeList;
    } else {
      throw Exception("error");
    }
  }

  Future<List<ImageLoadRequest>> loadImages(int recipeNo) async {
    var response = await http.get(Uri.http(httpUrl, '/recipe/$recipeNo'),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      debugPrint("통신 확인");

      var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      print(jsonData);

      List<ImageLoadRequest> imageList = jsonData
          .map((dataJson) => ImageLoadRequest.fromJson(dataJson))
          .toList();

      return imageList;
    } else {
      throw Exception("error");
    }
  }

  Future<void> recipeModify(ModifyRequest request) async {
    var response = await http.put(
      Uri.http(httpUrl, '/recipe/${request.recipeNo}'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'title': request.title,
        'category': request.category,
        'content': request.content
      }),
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    } else {
      throw ("error");
    }
  }

  Future<void> recipeDelete(int recipeNo) async {
    var response = await http.delete(
      Uri.http(httpUrl, '/recipe/$recipeNo'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      debugPrint("통신 확인");
    } else {
      throw ("error");
    }
  }
}

class RecipeUploadRequest {
  String title;
  String category;
  String content;
  String writer;

  RecipeUploadRequest(this.title, this.category, this.content, this.writer);
}

class RequestRecipe {
  int recipeNo;
  String title;
  String category;
  String writer;
  String content;
  String regDate;
  double rating;
  int likeCount;
  String thumbnail;
  String keyword;

  RequestRecipe(
      {required this.recipeNo,
      required this.title,
      required this.writer,
      required this.content,
      required this.regDate,
      required this.rating,
      required this.likeCount,
      required this.thumbnail,
      required this.category,
      required this.keyword});

  factory RequestRecipe.fromJson(Map<String, dynamic> json) {
    return RequestRecipe(
        recipeNo: json["recipeNo"],
        title: json["title"],
        writer: json["writer"],
        content: json["content"],
        regDate: json["regDate"],
        rating: json["rating"],
        likeCount: json["likeCount"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        keyword: json["keyword"]);
  }
}

class ImageLoadRequest {
  int imageNo;
  String imagePath;

  ImageLoadRequest({required this.imageNo, required this.imagePath});

  factory ImageLoadRequest.fromJson(Map<String, dynamic> json) {
    return ImageLoadRequest(
      imageNo: json["imageNo"],
      imagePath: json["imagePath"],
    );
  }
}

class ModifyRequest {
  int recipeNo;
  String title;
  String category;
  String content;

  ModifyRequest({
    required this.recipeNo,
    required this.title,
    required this.category,
    required this.content,
  });
}
