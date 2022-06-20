import 'package:forum_diskusi/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginAPI {
  loginAuth(LoginModel loginModel) async {
    final token = await Dio().post(
      'https://reqres.in/api/login',
      data: loginModel.toJson(),
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IkFETUlOIiwiaWQiOjIsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2NTUyOTgxMTAsImV4cCI6MTY1NTMwMTcxMH0.jWwdCP-NBLAuCUJ-CILdEHtnYStgjufwyszgWFZm2x8",
        },
      ),
    );
    print(token.data['token']);
  }
}
