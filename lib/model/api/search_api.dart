import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/search_model.dart';

class SearchAPI {
  final Dio dio = Dio();
  // final baseUrl = "http://35.247.191.49/api/v1/thread/search";

  Future getThreadBySearch(String title) async {
    final Dio dio = Dio();
    try {
      final Response response = await dio.get(
        "http://8.219.84.81/api/v1/thread/search?title=$title",
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      // dataThread = ThreadModel.fromJson(response.data).data;

      return (response.data['data']['content'] as List)
          .map((e) => Data.fromJson(e))
          .toList();
    } on DioError {
      rethrow;
    }
  }
}
