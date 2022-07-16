import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/thread_model.dart';

class ThreadAPI{
  final Dio dio = Dio();
  Future<List<Data>> getAllThread() async{
    List<Data>? dataThread;
    try{
      final Response response = await dio.get(
      'http://8.219.84.81/api/v1/thread', 
      options: Options(
        headers: {
          "Content-Type":
          "application/json"
        },
      ),
    );
    dataThread = ThreadModel.fromJson(response.data).data;
    
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
    return dataThread!;
  }

  Future<List<Data>> getTrendingThread() async{
    
    List<Data>? dataThread;
    try{
      final Response response = await dio.get(
      'http://8.219.84.81/api/v1/thread/trending/',
    );
    dataThread = ThreadModel.fromJson(response.data).data;
    
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
    return dataThread!;
  }

  Future getThreadByCategory(String kategori) async{
    try{
      final Response response = await dio.get(
        'http://8.219.84.81/api/v1/thread?category=$kategori'
      );
      var dataThreadByCategory = ThreadModel.fromJson(response.data);
      return dataThreadByCategory;
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
  }
}