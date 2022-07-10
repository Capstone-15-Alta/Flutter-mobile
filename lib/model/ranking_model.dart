class RankingModel{
  final content;

  RankingModel({this.content});

  factory RankingModel.fromJson(Map<String, dynamic> json){
    return RankingModel(
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson(){
    return { 
      'content': content,
   };
  }
}