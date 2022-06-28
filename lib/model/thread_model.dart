// class ThreadModel {
//   final int id;
//   final String title;
//   final String description;
//   final String image;
//   final Map<String, dynamic> category;
//   final String created_at;
//   final String created_by;
//   final Map<String, dynamic> user;
//   final List comments;
//   final List followers;
//   final List likes;
//   final List reports;
//   final int thread_followers;
//   final int thread_likes;
//   final Map<String, dynamic> view;

//   ThreadModel(
//       {required this.id,
//       required this.category,
//       required this.description,
//       required this.image,
//       required this.title,
//       required this.comments,
//       required this.created_at,
//       required this.created_by,
//       required this.followers,
//       required this.likes,
//       required this.reports,
//       required this.thread_followers,
//       required this.thread_likes,
//       required this.user,
//       required this.view});
      
//   factory ThreadModel.fromJson(Map<String, dynamic> json){
//     return ThreadModel(
//       id: json['id'],
//       category: json['category'],
//       description: json['description'],
//       image: json['image'],
//       title: json['title'],
//       comments: json['comments'],
//       created_at: json['created_at'],
//       created_by: json['created_by'],
//       followers: json['followers'],
//       likes: json['likes'],
//       reports: json['reports'],
//       thread_followers: json['thread_followers'],
//       thread_likes: json['thread_likes'],
//       user: json['user'],
//       view: json['view'],

//     );
//   }
//   Map<String, dynamic> toJson(){
//     return { 
//       'id' : id,
//       'category' : category,
//       'description' : description,
//       'image' : image,
//       'title' : title,
//       'comments' : comments,
//       'created_at' : created_at,
//       'created_by' : created_by,
//       'followers' : followers,
//       'likes' : likes,
//       'reports' : reports,
//       'thread_followers' : thread_followers,
//       'thread_likes' : thread_likes,
//       'user' : user,
//       'view' : view
//    };
//   }
  
// }

class ThreadModel {
  String? timestamp;
  String? message;
  List<Data>? data;

  ThreadModel({this.timestamp, this.message, this.data});

  ThreadModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

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