import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/postThread_api.dart';
import 'package:forum_diskusi/model/api/thread_api.dart';
import 'package:forum_diskusi/model/thread_model.dart';
import 'package:forum_diskusi/model/thread_postModel.dart';
import 'package:forum_diskusi/utils/finite_state.dart';

class ThreadViewModel extends ChangeNotifier {
  List<Data> _listGetThread = [];
  List<Data> get listGetThread => _listGetThread;

  final ThreadAPI threadAPI = ThreadAPI();

  MyState myState = MyState.initial;

  Future getAllThread() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final allThread = await threadAPI.getAllThread();
      _listGetThread = allThread;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future getThreadByCategory({required String category}) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final allThread = await threadAPI.getThreadByCategory(category);
      _listGetThread = allThread;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future getAllTrendingThread() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final allThread = await threadAPI.getTrendingThread();
      _listGetThread = allThread;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }

  postThread(ThreadPostModel threadPostModel) async {
    await PostThreadAPI().postThread(threadPostModel);
    notifyListeners();
  }
}
