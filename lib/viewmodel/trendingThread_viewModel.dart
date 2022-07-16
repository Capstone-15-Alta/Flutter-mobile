import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/thread_api.dart';
import 'package:forum_diskusi/model/thread_model.dart';

class TrendingTreadViewModel extends ChangeNotifier{
  List<Data> _listGetTrendingThread = [];
  List<Data> get listGetTrendingThread => _listGetTrendingThread;

  getAllTrendingThread() async{
    final allTrendingThread = await ThreadAPI().getTrendingThread();
    _listGetTrendingThread = allTrendingThread;
    notifyListeners();
  }
}
