import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/thread_model.dart';

class ThreadAPI {
  final Dio dio = Dio();
  Future<List<Data>> getAllThread() async {
    try {
      final Response response = await dio.get(
        'http://8.219.84.81/api/v1/thread',
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      final List<Data>? dataThread = ThreadModel.fromJson(response.data).data;
      return dataThread!;
    } on DioError {
      rethrow;
    }
  }

  Future<List<Data>> getTrendingThread() async {
    try {
      final Response response = await dio.get(
        'http://8.219.84.81/api/v1/thread/trending/',
      );
      final List<Data>? dataThread = ThreadModel.fromJson(response.data).data;
      return dataThread!;
    } on DioError {
      rethrow;
    }
  }

  Future<List<Data>> getThreadByCategory(String category) async {
    try {
      final Response response =
          await dio.get('http://8.219.84.81/api/v1/thread?category=$category');
      final List<Data>? dataThreadByCategory =
          ThreadModel.fromJson(response.data).data;
      return dataThreadByCategory!;
    } on DioError {
      rethrow;
    }
  }

  Future delete()async{
    try {
      final Response response = await dio.get(
        'http://8.219.84.81/api/v1/thread',
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      final List<Data>? dataThread = ThreadModel.fromJson(response.data).data;
      return dataThread!;
    } on DioError {
      rethrow;
    }
  }
}
