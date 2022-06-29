class UserTreadsModel {
  int? id;
  String? title;
  String? description;
  String? image;
  int? category_id;
  int? user_id;
  int? thread_followers;
  int? thread_likes;
  int? views;

  UserTreadsModel({
    this.id,
    this.title,
    this.category_id,
    this.description,
    this.image,
    this.thread_followers,
    this.thread_likes,
    this.user_id,
    this.views,
  });

  factory UserTreadsModel.fromJson(Map<String, dynamic> json){
    return UserTreadsModel(
      id: json['id'],
      title: json['title'],
      category_id: json['category_id'],
      description: json['description'],
      image: json['image'],
      thread_followers: json['thread_followers'],
      thread_likes: json['thread_likes'],
      user_id: json['user_id'],
      views: json['view']?['views']
    );
  }

}
  // "id": 3,
  //       "title": "test 123",
  //       "description": "test 123",
  //       "image": "http://34.87.190.0/api/images/9glMGDzZp4QC",
  //       "category_id": 1,
  //       "user_id": 2,
  //       "thread_followers": 0,
  //       "thread_likes": 0,
  //       "view": {
  //         "views": 0
  //       }