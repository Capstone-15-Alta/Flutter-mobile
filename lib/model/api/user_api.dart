import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/ranking_model.dart';
import 'package:forum_diskusi/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI{
  final Dio dio = Dio();
  Future<UserModel> getDataProfileUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final id = pref.getInt('id');
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
  
    Future getAllUserInApp() async{
    
    final Dio dio = Dio();
    const baseUrl = "http://8.219.84.81/api/v1/user/ranking";
    try{
      final Response response = await dio.get(baseUrl);
      final rankingUser = RankingModel.fromJson(response.data['data']);
      return rankingUser.content;
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
  }

}