class FollowModel {
  int? user_id;
  int? thread_id;
  bool? is_follow;
  String? follow_time;

  FollowModel({this.follow_time, this.is_follow, this.thread_id, this.user_id});

  factory FollowModel.fromJson(Map<String, dynamic> json) {
    return FollowModel(
        user_id: json['user_id'],
        thread_id: json['thread_id'],
        is_follow: json['is_follow'],
        follow_time: json['follow_time']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'thread_id': thread_id,
      'is_follow': is_follow,
      'follow_time': follow_time
    };
  }
}
