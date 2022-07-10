class ThreadPostModel {
  final data;

  ThreadPostModel({this.data});

  factory ThreadPostModel.fromJson(Map<String, dynamic> json){
    return ThreadPostModel(
      data: json['data']
    );
  }
  Map<String, dynamic> toJson(){
    return { 
      'data': data,
   };
  }
}