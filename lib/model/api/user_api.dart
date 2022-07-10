import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI{
  Future<UserModel> getDataProfileUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final id = pref.getInt('id');
    final Dio dio = Dio();
    UserModel? dataProfileUser;
    try{
      final Response response = await dio.get(
      'http://8.219.84.81/api/v1/user/$id',
    );
    dataProfileUser = UserModel.fromJson(response.data['data']);
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
    return dataProfileUser!;
  }
}

// Future<List<Data>> getAllThread() async{
//     final Dio dio = Dio();
//     List<Data>? dataThread;
//     try{
//       final Response response = await dio.get(
//       'http://34.87.190.0/api/v1/thread',
//     );
//     dataThread = ThreadModel.fromJson(response.data).data;
    
//     }on DioError catch(e){
//       print(e.response!.statusCode);
//     }
//     return dataThread!;
//   }