class CommentModel {
  int? id;
  int? thread_id;
  String? comment;
  String? created_at;
  Map<String, dynamic>? user;

  CommentModel(
      {this.id, this.comment, this.created_at, this.thread_id, this.user});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        id: json['id'],
        thread_id: json['thread_id'],
        comment: json['comment'],
        created_at: json['created_at'],
        user: json['user']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'thread_id': thread_id,
      'comment': comment,
      'created_at': created_at,
      'user': user
    };
  }
}
