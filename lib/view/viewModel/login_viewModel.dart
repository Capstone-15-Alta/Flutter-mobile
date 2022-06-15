// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/login_api.dart';
import 'package:forum_diskusi/model/login_model.dart';

class LoginViewModel with ChangeNotifier{
  
  postLogin(LoginModel loginModel) async{
    await LoginAPI().loginAuth(loginModel);
    notifyListeners();
  }
}