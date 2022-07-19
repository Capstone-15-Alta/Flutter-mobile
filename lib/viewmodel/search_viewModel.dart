import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/search_api.dart';
import 'package:forum_diskusi/model/search_model.dart';

class SearchUserViewModel extends ChangeNotifier {
  List<Data>? _listDataSearch;
  List<Data>? get listDataSearch => _listDataSearch;

  // List<dynamic> _listGetAllUserInApp = [];
  // List<dynamic> get listGetAllUserInApp => _listGetAllUserInApp;

  getDataSearch(title) async {
    final allSearch = await SearchAPI().getThreadBySearch(title);
    if (allSearch != null) {
      _listDataSearch = allSearch;
      notifyListeners();
    }
  }

  // getAllDataUserInApp() async {
  //   final allUserInApp = await UserAPI().getAllUserInApp();
  //   _listGetAllUserInApp = allUserInApp;
  //   notifyListeners();
  // }
}
