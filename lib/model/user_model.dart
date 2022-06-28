import 'package:forum_diskusi/model/list_dropdown.dart';

class ResponseAPI {
  DateTime timeStamp;
  String message;
  List<UserModel> userModel;

  ResponseAPI({required this.timeStamp, required this.message, required this.userModel});

  ResponseAPI.fromJson(Map<String, dynamic> json)
      : timeStamp = DateTime.parse(json['timestamp']),
        message = json['message'],
        userModel = (json['data'] as List).map((e) => UserModel.fromJson(e)).toList();
}

class UserModel {
  int id;
  String username;
  String phone;
  String email;
  String roles;
  String firstName;
  String lastName;
  DateTime birthDate;
  String education;
  String gender;
  String country;
  String city;
  String zipCode;
  String image;
  String imageCover;
  List<Data> threads;
  List<UserModel> threadFollowers;
  List<Data> theradLikes;
  List<String> comments;
  List<String> commentLikes;
  List<UserFollowers> userFollowers;
  List<UserFollowers> userFollowing;
  int totalUserFollowers;
  int totalUserFollowing;
  int totalThreads;
  int totalPostComments;

  UserModel({
    required this.id,
    required this.username,
    required this.phone,
    required this.email,
    required this.roles,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.education,
    required this.gender,
    required this.country,
    required this.city,
    required this.zipCode,
    required this.image,
    required this.imageCover,
    required this.threads,
    required this.threadFollowers,
    required this.theradLikes,
    required this.comments,
    required this.commentLikes,
    required this.userFollowers,
    required this.userFollowing,
    required this.totalUserFollowers,
    required this.totalUserFollowing,
    required this.totalThreads,
    required this.totalPostComments,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        phone = json['phone'],
        email = json['email'],
        roles = json['roles'],
        firstName = json['firs_name'],
        lastName = json['last_name'],
        birthDate = json['birth_date'],
        education = json['education'],
        gender = json['gender'],
        country = json['country'],
        city = json['city'],
        zipCode = json['zip_code'],
        image = json['image'],
        imageCover = json['image_cover'],
        threads = (json['threads'] as List).map((e) => Data.fromJson(e)).toList(),
        threadFollowers = (json['thread_followers'] as List).map((e) => UserModel.fromJson(e)).toList(),
        theradLikes = (json['thread_likes'] as List).map((e) => Data.fromJson(e)).toList(),
        comments = json['comments'],
        commentLikes = json['comment_likes'],
        userFollowers = (json['user_followers'] as List).map((e) => UserFollowers.fromJson(e)).toList(),
        userFollowing = (json['user_following'] as List).map((e) => UserFollowers.fromJson(e)).toList(),
        totalUserFollowers = json['total_user_followers'],
        totalUserFollowing = json['total_user_following'],
        totalThreads = json['total_threads'],
        totalPostComments = json['total_post_comments'];
}

class UserFollowers {
  int userFollowerId;
  int userFollowedId;
  bool isFollow;
  DateTime followTime;

  UserFollowers({
    required this.userFollowerId,
    required this.userFollowedId,
    required this.isFollow,
    required this.followTime,
  });

  UserFollowers.fromJson(Map<String, dynamic> json)
      : userFollowerId = json['user_follower_id'],
        userFollowedId = json['user_followed_id'],
        isFollow = json['is_follow'],
        followTime = json['follow_time'];
}