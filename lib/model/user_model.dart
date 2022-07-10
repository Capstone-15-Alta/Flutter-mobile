import 'package:forum_diskusi/model/user_treads_model.dart';

// class ResponseAPI {
//   String? timeStamp;
//   String? message;
//   List<UserModel>? userModel;

//   ResponseAPI({this.timeStamp, this.message, this.userModel});

//   factory ResponseAPI.fromJson(Map<String, dynamic> json) => ResponseAPI(
//     timeStamp: json['timeStamp'],
//     message: json['message'],
//     userModel: (json['data'] as List).map((e) => UserModel.fromJson(e)).toList()
//     );
// }

class UserModel {
  int? id;
  String? username;
  String? phone;
  String? email;
  String? roles;
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  String? education;
  String? gender;
  String? country;
  String? city;
  String? zipCode;
  String? image;
  String? imageCover;
  List? threads;
  List? threadFollowers;
  List? theradLikes;
  List? comments;
  List? commentLikes;
  List? userFollowers;
  List? userFollowing;
  int? totalUserFollowers;
  int? totalUserFollowing;
  int? totalThreads;
  int? totalPostComments;
  int? userFollowerId;
  int? userFollowedId;
  bool? isFollow;
  String? followTime;

  UserModel({
    this.id,
    this.username,
    this.phone,
    this.email,
    this.roles,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.education,
    this.gender,
    this.country,
    this.city,
    this.zipCode,
    this.image,
    this.imageCover,
    this.threads,
    this.threadFollowers,
    this.theradLikes,
    this.comments,
    this.commentLikes,
    this.userFollowers,
    this.userFollowing,
    this.totalUserFollowers,
    this.totalUserFollowing,
    this.totalThreads,
    this.totalPostComments,
    this.userFollowerId,
    this.userFollowedId,
    this.isFollow,
    this.followTime,
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
        threads =
            (json['threads'] as List).map((e) => UserTreadsModel.fromJson(e)).toList(),
        threadFollowers = (json['thread_followers'] as List)
            .map((e) => UserModel.fromJson(e))
            .toList(),
        theradLikes = (json['thread_likes'] as List)
            .map((e) => UserTreadsModel.fromJson(e))
            .toList(),
        comments = json['comments'],
        commentLikes = json['comment_likes'],
        userFollowers = json['user_followers'],
        userFollowing = json['user_following'],
        totalUserFollowers = json['total_user_followers'],
        totalUserFollowing = json['total_user_following'],
        totalThreads = json['total_threads'],
        totalPostComments = json['total_post_comments'],
        userFollowerId = json['user_follower_id'],
        userFollowedId = json['user_followed_id'],
        isFollow = json['is_follow'],
        followTime = json['follow_time'];
}

// class UserFollowers {
//   int? userFollowerId;
//   int? userFollowedId;
//   bool? isFollow;
//   String? followTime;

//   UserFollowers({
//     this.userFollowerId,
//     this.userFollowedId,
//     this.isFollow,
//     this.followTime,
//   });

//   UserFollowers.fromJson(Map<String, dynamic> json)
//       : userFollowerId = json['user_follower_id'],
//         userFollowedId = json['user_followed_id'],
//         isFollow = json['is_follow'],
//         followTime = json['follow_time'];
// }
