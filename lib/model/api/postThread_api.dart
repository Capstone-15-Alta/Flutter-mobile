import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/thread_postModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostThreadAPI {
  Future postThread(ThreadPostModel threadPostModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token')!;
    int id = pref.getInt('id')!;
    final Dio dio = Dio();
    final data = {
      "title" : threadPostModel.title,
      "description" : threadPostModel.description,
      "category_id" : threadPostModel.category_id
    };
    try {
      final FormData formData = FormData.fromMap({
        "json" : """{
        "title" : "${threadPostModel.title}",
        "description" : "${threadPostModel.description}",
        "category_id" : "${threadPostModel.category_id}"
      }"""
      });
      await dio.post(
        'http://8.219.84.81/api/v1/thread',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
            'Accept': 'application/json'
          },
        ),
      );
    } on DioError catch (e) {
      print(e.response!.data);
    }
  }
}
