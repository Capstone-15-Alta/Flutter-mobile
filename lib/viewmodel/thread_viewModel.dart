import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/thread_api.dart';
import 'package:forum_diskusi/model/thread_model.dart';

class ThreadViewModel extends ChangeNotifier{
  
  List<Data> _listGetThread = [];
  List<Data> get listGetThread => _listGetThread;

  List<Data> _listGetTrendingThread = [];
  List<Data> get listGetTrendingThread => _listGetTrendingThread;
  
  // List<Data> _listGetThreadByCategory = [];
  // List<Data> get listGetThreadByCategory => _listGetThreadByCategory;


  // getThread(String category)async{
  //     final allThreadByCategory = await ThreadAPI().getAllThread();
  //     _listGetThreadByCategory = allThreadByCategory;
  //     _listGetThreadByCategory.where((element) => element.category['category_name'] == category,);
  //     notifyListeners();
  // }

  getAllThread()async{
    final allThread = await ThreadAPI().getAllThread();
    _listGetThread = allThread;
    notifyListeners();
  }

}