import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/thread_model.dart';

class ThreadAPI{
  
  Future<List<Data>> getAllThread() async{
    final Dio dio = Dio();
    List<Data>? dataThread;
    try{
      final Response response = await dio.get(
      'http://34.87.190.0/api/v1/thread',
    );
    dataThread = ThreadModel.fromJson(response.data).data;
    
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
    return dataThread!;
  }

  Future<List<Data>> postThread() async{
    final Dio dio = Dio();
    List<Data>? dataThread;
    try{
      final Response response = await dio.post(
      'http://34.87.190.0/api/v1/thread',
    );
    dataThread = ThreadModel.fromJson(response.data).data;
    
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
    return dataThread!;
  }
  
  // Future postThread() async{
  //   final Dio dio = Dio();
  //   try{
  //     final Response response = await dio.post(
  //     'http://34.87.190.0/api/v1/thread',
  //     data: jsonEncode({

  //     })
  //   );
  //   var dataThread = response.data['data'] as List;
  //   print(dataThread);
  //   }on DioError catch(e){
  //     print(e.response!.statusCode);
  //   }
  // }
}