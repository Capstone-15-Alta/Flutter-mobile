import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/postThread_api.dart';
import 'package:forum_diskusi/model/api/thread_api.dart';
import 'package:forum_diskusi/model/thread_model.dart';
import 'package:forum_diskusi/model/thread_postModel.dart';

class ThreadViewModel extends ChangeNotifier{
  
  List<Data> _listGetThread = [];
  List<Data> get listGetThread => _listGetThread;

  final List<Data> _listGetTrendingThread = [];
  List<Data> get listGetTrendingThread => _listGetTrendingThread;
  
  final List<Data> _listGetThreadByCategory = [];
  List<Data> get listGetThreadByCategory => _listGetThreadByCategory;

  getAllThread()async{
    final allThread = await ThreadAPI().getAllThread();
    _listGetThread = allThread;
    notifyListeners();
  }

  postThread(ThreadPostModel threadPostModel)async{
      await PostThreadAPI().postThread(threadPostModel);
    notifyListeners();
  }
}