import 'package:forum_diskusi/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAPI {
  final Dio dio = Dio();
  Future loginAuth(LoginModel loginModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      final Response response = await dio.post(
      'http://34.87.190.0/api/v1/auth/login',
      data: loginModel.toJson(),
      // options: Options(
      //   headers: {
      //     "Authorization":
      //         "Bearer eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IkFETUlOIiwiaWQiOjIsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2NTUyOTgxMTAsImV4cCI6MTY1NTMwMTcxMH0.jWwdCP-NBLAuCUJ-CILdEHtnYStgjufwyszgWFZm2x8",
      //   },
      // ),
    );
    print(response);
    pref.setInt('id', response.data['data']['id']);
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
  }
}
