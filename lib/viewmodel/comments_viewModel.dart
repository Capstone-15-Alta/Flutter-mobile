import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/comment_api.dart';
import 'package:forum_diskusi/model/comment_model.dart';
import 'package:forum_diskusi/model/postComment_Model.dart';

class CommentsViewModel extends ChangeNotifier {
  List<CommentModel> _listGetComments = [];
  List<CommentModel> get listgetComments => _listGetComments;

  getAllComments(int id) async {
    _listGetComments = await CommentAPI().getComment(id);
    notifyListeners();
  }

  postCommentOnThread(PostCommentModel postCommentModel) async {
    await CommentAPI().postCommentOnThread(postCommentModel);
    notifyListeners();
  }

  putLikeOnComment(int id) async {
    await CommentAPI().putLikeOnThread(id);
    notifyListeners();
  }

  followThread(int id) async {
    await CommentAPI().followThread(id);
    notifyListeners();
  }
}
