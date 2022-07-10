class SearchModel{
  final content;

  SearchModel({this.content});

  factory SearchModel.fromJson(Map<String, dynamic> json){
    return SearchModel(
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson(){
    return { 
      'content': content,
   };
  }
}