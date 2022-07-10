import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/user_api.dart';
import 'package:forum_diskusi/model/user_model.dart';

class UserViewModel extends ChangeNotifier{
  UserModel? _listDataUser;
  UserModel? get listDataUser => _listDataUser;

  getDataUser() async{
    final allUser = await UserAPI().getDataProfileUser();
    _listDataUser = allUser;
    notifyListeners();
  }
}
