import 'package:forum_diskusi/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginAPI {
  //gimana cara jika error atau response 500 tidak masuk ke home
  final Dio dio = Dio();
  Future loginAuth(LoginModel loginModel) async {
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
    return response;
    }on DioError catch(e){
      // print(e.toString());
      print(e.response!.statusCode);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
    }
  }
}
