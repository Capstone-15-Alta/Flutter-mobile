// "comment": "string",
// "comment_likes": 0,
// "created_at": "dd-MM-yyyy HH:mm:ss",
// "id": 0,
// "thread_id": 0,
// "user_id": 0

class PostCommentModel {
  String? comment;
  int? comment_likes;
  String? created_at;
  int? id;
  int? thread_id;
  int? user_id;

  PostCommentModel(
      {this.comment,
      this.comment_likes,
      this.created_at,
      this.id,
      this.thread_id,
      this.user_id});

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    return PostCommentModel(
        comment: json['comment'],
        comment_likes: json['comment_likes'],
        created_at: json['created_at'],
        id: json['id'],
        thread_id: json['thread_id'],
        user_id: json['user_id']);
  }
  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'created_at': created_at,
      'comment_likes': comment_likes,
      'id': id,
      'thread_id': thread_id,
      'user_id': user_id
    };
  }
}
