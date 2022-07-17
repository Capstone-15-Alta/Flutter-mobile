import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/comment_model.dart';

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
}
