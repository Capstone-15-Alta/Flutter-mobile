import 'package:forum_diskusi/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginAPI{
  
  loginAuth(LoginModel loginModel) async{
   final token = await Dio().post('https://reqres.in/api/login', data: loginModel.toJson());
    print(token.data['token']);
  }
}