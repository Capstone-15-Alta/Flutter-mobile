 import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/thread_postModel.dart';

class PostThreadAPI{
   Future postThread(int id) async{
    final Dio dio = Dio();
    try{
      final Response response = await dio.post(
      'http://8.219.84.81/api/v1/thread/$id',
    );
    ThreadPostModel.fromJson(response.data).data;
    
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
  }
 }