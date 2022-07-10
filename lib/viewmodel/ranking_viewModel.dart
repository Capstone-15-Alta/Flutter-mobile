import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/ranking_api.dart';

class RankingUserViewModel extends ChangeNotifier{
  List<dynamic> _listDataRankingUser = [];
  List<dynamic> get listDataRankingUser => _listDataRankingUser;

  getDataRankingUser() async{
    final allRanking = await UserRankingAPI().getUserRanking();
    _listDataRankingUser = allRanking;
    notifyListeners();
  }
}