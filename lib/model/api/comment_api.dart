import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/comment_model.dart';
import 'package:forum_diskusi/model/postComment_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentAPI {
  Dio dio = Dio();
  Future getComment(int id) async {
    try {
      final response =
          await dio.get("http://8.219.84.81/api/v1/comment/thread/$id");
      List<CommentModel> comments = (response.data['data'] as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
      // print(comments[0].comment);
      return comments;
    } catch (e) {
      rethrow;
    }
  }

  Future postCommentOnThread(PostCommentModel postCommentModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token')!;
    try {
      await dio.post(
        "http://8.219.84.81/api/v1/comment",
        data: postCommentModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
