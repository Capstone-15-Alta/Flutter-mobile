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
  String? title;
  String? description;
  String? image;
  Category? category;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  User? user;
  List<Comments>? comments;
  List<Followers>? followers;
  List<Likes>? likes;
  // List<Repo>? reports;
  int? threadFollowers;
  int? threadLikes;
  View? view;

  Data(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.user,
      this.comments,
      this.followers,
      this.likes,
      // this.reports,
      this.threadFollowers,
      this.threadLikes,
      this.view});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(Followers.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    // if (json['reports'] != null) {
    //   reports = <Null>[];
    //   json['reports'].forEach((v) {
    //     reports!.add(Null.fromJson(v));
    //   });
    // }
    threadFollowers = json['thread_followers'];
    threadLikes = json['thread_likes'];
    view = json['view'] != null ? View.fromJson(json['view']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by'] = createdBy;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (followers != null) {
      data['followers'] = followers!.map((v) => v.toJson()).toList();
    }
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    // if (reports != null) {
    //   data['reports'] = reports!.map((v) => v.toJson()).toList();
    // }
    data['thread_followers'] = threadFollowers;
    data['thread_likes'] = threadLikes;
    if (view != null) {
      data['view'] = view!.toJson();
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