class LikeModel {
  int? user_id;
  int? thread_id;
  bool? id_like;
  String? like_time;

  LikeModel({this.id_like, this.like_time, this.thread_id, this.user_id});

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
        user_id: json['user_id'],
        thread_id: json['thread_id'],
        id_like: json['id_like'],
        like_time: json['like_time']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'thread_id': thread_id,
      'id_like': id_like,
      'like_time': like_time
    };
  }
}
