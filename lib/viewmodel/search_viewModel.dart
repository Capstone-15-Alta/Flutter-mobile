import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/ranking_api.dart';
import 'package:forum_diskusi/model/api/search_api.dart';
import 'package:forum_diskusi/model/search_model.dart';

class SearchUserViewModel extends ChangeNotifier{
  List<Data>? _listDataSearch;
  List<Data>? get listDataSearch => _listDataSearch;

  getDataSearch(title) async{
    final allSearch = await SearchAPI().getThreadBySearch(title);
    if(allSearch != null){
      _listDataSearch = allSearch;
      notifyListeners();
    }
       
  }
}