import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/ranking_api.dart';
import 'package:forum_diskusi/model/api/search_api.dart';

class SearchUserViewModel extends ChangeNotifier{
  List<dynamic> _listDataSearch = [];
  List<dynamic> get listDataSearch => _listDataSearch;

  getDataSearch(title) async{
    final allSearch = await SearchAPI().getThreadBySearch(title);
    _listDataSearch = allSearch;
    notifyListeners();
  }
}