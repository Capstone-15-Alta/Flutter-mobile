class ThreadPostModel {
  int? id;
  String? title;
  String? description;
  String? image;
  int? category_id;
  String? user_id;
  String? thread_followers;
  String? thread_likes;

  ThreadPostModel({this.category_id,this.description,this.id,this.image,this.thread_followers,this.thread_likes,this.title,this.user_id});

  factory ThreadPostModel.fromJson(Map<String, dynamic> json){
    return ThreadPostModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      category_id: json['category_id'],
      user_id: json['user_id'],
      thread_followers: json['thread_followers'],
      thread_likes: json['thread_likes']
    );
  }
  Map<String, dynamic> toJson(){
    return { 
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'category_id': category_id,
      'user_id': user_id,
      'thread_followers': thread_followers,
      'thread_likes': thread_likes,
   };
  }
}