class GetUserInAppModel {
  String? timestamp;
  String? message;
  Data? data;

  GetUserInAppModel({this.timestamp, this.message, this.data});

  GetUserInAppModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  bool? first;
  Sort? sort;
  int? number;
  int? numberOfElements;
  int? size;
  bool? empty;

  Data(
      {this.content,
      this.pageable,
      this.last,
      this.totalElements,
      this.totalPages,
      this.first,
      this.sort,
      this.number,
      this.numberOfElements,
      this.size,
      this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    first = json['first'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    size = json['size'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['last'] = last;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['first'] = first;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['number'] = number;
    data['numberOfElements'] = numberOfElements;
    data['size'] = size;
    data['empty'] = empty;
    return data;
  }
}

class Content {
  int? id;
  String? username;
  String? email;
  String? roles;
  String? image;
  String? imageCover;
  List<Threads>? threads;
  List<ThreadLikes>? threadLikes;
  List<UserFollowers>? userFollowers;
  List<UserFollowing>? userFollowing;
  List<Notifications>? notifications;
  List<SaveThread>? saveThread;
  int? totalUserFollowers;
  int? totalUserFollowing;
  int? totalThreads;
  int? totalPostComments;
  int? totalLikeThread;
  int? totalLikeComment;

  Content(
      {this.id,
      this.username,
      this.email,
      this.roles,
      this.image,
      this.imageCover,
      this.threads,
      this.threadLikes,
      this.userFollowers,
      this.userFollowing,
      this.notifications,
      this.saveThread,
      this.totalUserFollowers,
      this.totalUserFollowing,
      this.totalThreads,
      this.totalPostComments,
      this.totalLikeThread,
      this.totalLikeComment});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'];
    image = json['image'];
    imageCover = json['image_cover'];
    if (json['threads'] != null) {
      threads = <Threads>[];
      json['threads'].forEach((v) {
        threads!.add(Threads.fromJson(v));
      });
    }
    if (json['thread_likes'] != null) {
      threadLikes = <ThreadLikes>[];
      json['thread_likes'].forEach((v) {
        threadLikes!.add(ThreadLikes.fromJson(v));
      });
    }
    if (json['user_followers'] != null) {
      userFollowers = <UserFollowers>[];
      json['user_followers'].forEach((v) {
        userFollowers!.add(UserFollowers.fromJson(v));
      });
    }
    if (json['user_following'] != null) {
      userFollowing = <UserFollowing>[];
      json['user_following'].forEach((v) {
        userFollowing!.add(UserFollowing.fromJson(v));
      });
    }
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
    if (json['save_thread'] != null) {
      saveThread = <SaveThread>[];
      json['save_thread'].forEach((v) {
        saveThread!.add(SaveThread.fromJson(v));
      });
    }
    totalUserFollowers = json['total_user_followers'];
    totalUserFollowing = json['total_user_following'];
    totalThreads = json['total_threads'];
    totalPostComments = json['total_post_comments'];
    totalLikeThread = json['total_like_thread'];
    totalLikeComment = json['total_like_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['roles'] = roles;
    data['image'] = image;
    data['image_cover'] = imageCover;
    if (threads != null) {
      data['threads'] = threads!.map((v) => v.toJson()).toList();
    }
    if (threadLikes != null) {
      data['thread_likes'] = threadLikes!.map((v) => v.toJson()).toList();
    }
    if (userFollowers != null) {
      data['user_followers'] = userFollowers!.map((v) => v.toJson()).toList();
    }
    if (userFollowing != null) {
      data['user_following'] = userFollowing!.map((v) => v.toJson()).toList();
    }
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    if (saveThread != null) {
      data['save_thread'] = saveThread!.map((v) => v.toJson()).toList();
    }
    data['total_user_followers'] = totalUserFollowers;
    data['total_user_following'] = totalUserFollowing;
    data['total_threads'] = totalThreads;
    data['total_post_comments'] = totalPostComments;
    data['total_like_thread'] = totalLikeThread;
    data['total_like_comment'] = totalLikeComment;
    return data;
  }
}

class Threads {
  int? id;
  String? title;
  String? description;
  String? image;
  int? categoryId;
  int? userId;
  int? threadFollowers;
  int? threadLikes;
  int? totalComments;
  View? view;

  Threads(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.categoryId,
      this.userId,
      this.threadFollowers,
      this.threadLikes,
      this.totalComments,
      this.view});

  Threads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    threadFollowers = json['thread_followers'];
    threadLikes = json['thread_likes'];
    totalComments = json['total_comments'];
    view = json['view'] != null ? View.fromJson(json['view']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['category_id'] = categoryId;
    data['user_id'] = userId;
    data['thread_followers'] = threadFollowers;
    data['thread_likes'] = threadLikes;
    data['total_comments'] = totalComments;
    if (view != null) {
      data['view'] = view!.toJson();
    }
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

class ThreadLikes {
  int? userId;
  int? threadId;
  bool? isLike;
  String? likeTime;

  ThreadLikes({this.userId, this.threadId, this.isLike, this.likeTime});

  ThreadLikes.fromJson(Map<String, dynamic> json) {
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

class UserFollowers {
  UserFollower? userFollower;
  int? userFollowedId;
  bool? isFollow;
  String? followTime;

  UserFollowers(
      {this.userFollower, this.userFollowedId, this.isFollow, this.followTime});

  UserFollowers.fromJson(Map<String, dynamic> json) {
    userFollower = json['user_follower'] != null
        ? UserFollower.fromJson(json['user_follower'])
        : null;
    userFollowedId = json['user_followed_id'];
    isFollow = json['is_follow'];
    followTime = json['follow_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userFollower != null) {
      data['user_follower'] = userFollower!.toJson();
    }
    data['user_followed_id'] = userFollowedId;
    data['is_follow'] = isFollow;
    data['follow_time'] = followTime;
    return data;
  }
}

class UserFollower {
  int? id;
  String? username;
  String? password;
  String? email;
  String? phone;
  String? image;
  String? imageCover;
  String? roles;
  int? totalUserFollowers;
  int? totalUserFollowing;
  int? totalThreads;
  int? totalPostComments;
  int? totalLikeThread;
  int? totalLikeComment;

  UserFollower(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.phone,
      this.image,
      this.imageCover,
      this.roles,
      this.totalUserFollowers,
      this.totalUserFollowing,
      this.totalThreads,
      this.totalPostComments,
      this.totalLikeThread,
      this.totalLikeComment});

  UserFollower.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    imageCover = json['image_cover'];
    roles = json['roles'];
    totalUserFollowers = json['total_user_followers'];
    totalUserFollowing = json['total_user_following'];
    totalThreads = json['total_threads'];
    totalPostComments = json['total_post_comments'];
    totalLikeThread = json['total_like_thread'];
    totalLikeComment = json['total_like_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['image_cover'] = imageCover;
    data['roles'] = roles;
    data['total_user_followers'] = totalUserFollowers;
    data['total_user_following'] = totalUserFollowing;
    data['total_threads'] = totalThreads;
    data['total_post_comments'] = totalPostComments;
    data['total_like_thread'] = totalLikeThread;
    data['total_like_comment'] = totalLikeComment;
    return data;
  }
}

class UserFollowing {
  int? userFollowerId;
  UserFollower? userFollowed;
  bool? isFollow;
  String? followTime;

  UserFollowing(
      {this.userFollowerId, this.userFollowed, this.isFollow, this.followTime});

  UserFollowing.fromJson(Map<String, dynamic> json) {
    userFollowerId = json['user_follower_id'];
    userFollowed = json['user_followed'] != null
        ? UserFollower.fromJson(json['user_followed'])
        : null;
    isFollow = json['is_follow'];
    followTime = json['follow_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_follower_id'] = userFollowerId;
    if (userFollowed != null) {
      data['user_followed'] = userFollowed!.toJson();
    }
    data['is_follow'] = isFollow;
    data['follow_time'] = followTime;
    return data;
  }
}

class Notifications {
  int? id;
  int? userId;
  String? title;
  String? message;
  int? threadId;
  int? followerId;
  String? createdAt;
  bool? isRead;

  Notifications(
      {this.id,
      this.userId,
      this.title,
      this.message,
      this.threadId,
      this.followerId,
      this.createdAt,
      this.isRead});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    message = json['message'];
    threadId = json['thread_id'];
    followerId = json['follower_id'];
    createdAt = json['created_at'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['message'] = message;
    data['thread_id'] = threadId;
    data['follower_id'] = followerId;
    data['created_at'] = createdAt;
    data['is_read'] = isRead;
    return data;
  }
}

class SaveThread {
  int? userId;
  Thread? thread;
  bool? isSave;
  String? saveTime;

  SaveThread({this.userId, this.thread, this.isSave, this.saveTime});

  SaveThread.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    thread = json['thread'] != null ? Thread.fromJson(json['thread']) : null;
    isSave = json['is_save'];
    saveTime = json['save_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    if (thread != null) {
      data['thread'] = thread!.toJson();
    }
    data['is_save'] = isSave;
    data['save_time'] = saveTime;
    return data;
  }
}

class Thread {
  int? id;
  String? title;
  String? description;
  String? image;
  Category? category;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  int? userId;
  List<Comments>? comments;
  List<Save>? save;
  List<Reports>? reports;
  int? threadFollowers;
  int? threadLikes;
  int? totalComments;
  View? view;

  Thread(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.userId,
      this.comments,
      this.save,
      this.reports,
      this.threadFollowers,
      this.threadLikes,
      this.totalComments,
      this.view});

  Thread.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    userId = json['user_id'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    if (json['save'] != null) {
      save = <Save>[];
      json['save'].forEach((v) {
        save!.add(Save.fromJson(v));
      });
    }
    if (json['reports'] != null) {
      reports = <Reports>[];
      json['reports'].forEach((v) {
        reports!.add(Reports.fromJson(v));
      });
    }
    threadFollowers = json['thread_followers'];
    threadLikes = json['thread_likes'];
    totalComments = json['total_comments'];
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
    data['user_id'] = userId;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (save != null) {
      data['save'] = save!.map((v) => v.toJson()).toList();
    }
    if (reports != null) {
      data['reports'] = reports!.map((v) => v.toJson()).toList();
    }
    data['thread_followers'] = threadFollowers;
    data['thread_likes'] = threadLikes;
    data['total_comments'] = totalComments;
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

class Comments {
  int? id;
  int? userId;
  int? threadId;
  String? comment;
  int? commentLikes;
  String? createdAt;

  Comments(
      {this.id,
      this.userId,
      this.threadId,
      this.comment,
      this.commentLikes,
      this.createdAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    threadId = json['thread_id'];
    comment = json['comment'];
    commentLikes = json['comment_likes'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['thread_id'] = threadId;
    data['comment'] = comment;
    data['comment_likes'] = commentLikes;
    data['created_at'] = createdAt;
    return data;
  }
}

class Save {
  int? userId;
  int? threadId;
  bool? isSave;
  String? saveTime;

  Save({this.userId, this.threadId, this.isSave, this.saveTime});

  Save.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    threadId = json['thread_id'];
    isSave = json['is_save'];
    saveTime = json['save_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['thread_id'] = threadId;
    data['is_save'] = isSave;
    data['save_time'] = saveTime;
    return data;
  }
}

class Reports {
  int? id;
  int? userId;
  int? threadId;
  String? report;
  String? reportTime;

  Reports({this.id, this.userId, this.threadId, this.report, this.reportTime});

  Reports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    threadId = json['thread_id'];
    report = json['report'];
    reportTime = json['report_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['thread_id'] = threadId;
    data['report'] = report;
    data['report_time'] = reportTime;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? pageNumber;
  int? pageSize;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
      this.pageNumber,
      this.pageSize,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? unsorted;
  bool? sorted;
  bool? empty;

  Sort({this.unsorted, this.sorted, this.empty});

  Sort.fromJson(Map<String, dynamic> json) {
    unsorted = json['unsorted'];
    sorted = json['sorted'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unsorted'] = unsorted;
    data['sorted'] = sorted;
    data['empty'] = empty;
    return data;
  }
}
