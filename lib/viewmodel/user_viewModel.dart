import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/user_api.dart';
import 'package:forum_diskusi/model/user_model.dart';

class UserViewModel extends ChangeNotifier{
  UserModel? _listDataUser;
  UserModel? get listDataUser => _listDataUser;

  List<dynamic> _listGetAllUserInApp = [];
  List<dynamic> get listGetAllUserInApp => _listGetAllUserInApp;

  getDataUser() async{
    final allUser = await UserAPI().getDataProfileUser();
    _listDataUser = allUser;
    notifyListeners();
  }

  getAllDataUserInApp() async{
    final allUserInApp = await UserAPI().getAllUserInApp();
    _listGetAllUserInApp = allUserInApp;
    notifyListeners();
  }
}
