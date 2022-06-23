import 'package:forum_diskusi/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginAPI {
  final Dio dio = Dio();
  Future loginAuth(LoginModel loginModel) async {
    try{
      final Response response = await dio.post(
      'https://reqres.in/api/login',
      data: loginModel.toJson(),
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IkFETUlOIiwiaWQiOjIsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2NTUyOTgxMTAsImV4cCI6MTY1NTMwMTcxMH0.jWwdCP-NBLAuCUJ-CILdEHtnYStgjufwyszgWFZm2x8",
        },
      ),
    );
    print(response.statusCode);
    }on DioError catch(e){
      // print(e.toString());
      print(e.response!.statusCode);
    }
    
    // print(token.data['token']);
  }
}
