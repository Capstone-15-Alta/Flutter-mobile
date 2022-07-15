class GetUserModel {
  String? timestamp;
  String? message;
  List<Data>? data;

  GetUserModel({this.timestamp, this.message, this.data});

  GetUserModel.fromJson(Map<String, dynamic> json) :
    timestamp = json['timestamp'],
    message = json['message'],
      data = json['data']['content'] != null ?  (json['data']['content'] as List).map((v) {
        return Data.fromJson(v); 
      }).toList() : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;

  String? createdBy;
  User? user;


  Data(
      {this.id,

      this.createdBy,
      this.user,


      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    user = json['user'] != null ? User.fromJson(json['user']) : null;



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_by'] = createdBy;
    if (user != null) {
      data['user'] = user!.toJson();
    }

    return data;
  }
}

class Category {
  int? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? password;
  String? phone;
  String? email;
  String? roles;
  int? totalUserFollowers;

  User(
      {this.id,
      this.username,
      this.password,
      this.phone,
      this.email,
      this.roles,
      this.totalUserFollowers});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    phone = json['phone'];
    email = json['email'];
    roles = json['roles'];
    totalUserFollowers = json['total_user_followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['phone'] = phone;
    data['email'] = email;
    data['roles'] = roles;
    data['total_user_followers'] = totalUserFollowers;
    return data;
  }
}

class Comments {
  int? id;
  int? userId;
  int? threadId;
  String? comment;

  Comments({this.id, this.userId, this.threadId, this.comment});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    threadId = json['thread_id'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['thread_id'] = threadId;
    data['comment'] = comment;
    return data;
  }
}

class Followers {
  int? userId;
  int? threadId;
  bool? isFollow;
  String? followTime;

  Followers({this.userId, this.threadId, this.isFollow, this.followTime});

  Followers.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    threadId = json['thread_id'];
    isFollow = json['is_follow'];
    followTime = json['follow_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['thread_id'] = threadId;
    data['is_follow'] = isFollow;
    data['follow_time'] = followTime;
    return data;
  }
}

class Likes {
  int? userId;
  int? threadId;
  bool? isLike;
  String? likeTime;

  Likes({this.userId, this.threadId, this.isLike, this.likeTime});

  Likes.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    threadId = json['thread_id'];
    isLike = json['is_like'];
    likeTime = json['like_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['thread_id'] = threadId;
    data['is_like'] = isLike;
    data['like_time'] = likeTime;
    return data;
  }
}

class View {
  int? views;

  View({this.views});

  View.fromJson(Map<String, dynamic> json) {
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['views'] = views;
    return data;
  }
}