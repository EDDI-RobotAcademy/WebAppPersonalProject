import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class SpringUploadApi {
  static const String httpUrl = '172.30.1.3:7777';

  Future<void> uploadFiles(List<XFile> images) async {
    final List<MultipartFile> _files = images
        .map((img) => MultipartFile.fromFileSync(img.path,
            contentType: MediaType("image", "jpg")))
        .toList();


      // 파일 경로를 통해 formData 생성
      var dio = Dio();
      var _formData = FormData.fromMap({
        'files': _files
      });

      print(_formData);
      // 업로드 요청
    dio.options.headers["authorization"];
    dio.options.contentType = 'multipart/form-data';

    final res = await dio.post(
        'http://172.30.1.3:7777/recipe-image/upload',
        data: _formData).then((res) {
      return res.data;
    });
  }
}
