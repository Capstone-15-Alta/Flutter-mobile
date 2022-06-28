
import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/login_api.dart';
import 'package:forum_diskusi/model/api/register_api.dart';
import 'package:forum_diskusi/model/register_model.dart';

class RegisterViewModel with ChangeNotifier{
  
  postRegister(RegisterModel registerModel)async{
    await RegisterAPI().registerAuth(registerModel);
    notifyListeners();
  }
}