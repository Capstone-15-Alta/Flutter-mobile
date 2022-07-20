import 'package:forum_diskusi/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAPI {
  final Dio dio = Dio();
  Future loginAuth(LoginModel loginModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      final Response response = await dio.post(
        'http://8.219.84.81/api/v1/auth/login',
        data: loginModel.toJson(),
      );
      if (response.statusCode == 200) {
        pref.setString('token', response.data['data']['token']);
      }
      pref.setInt('id', response.data['data']['id']);
    } catch (e) {
      throw e.toString();
    }
  }
}
