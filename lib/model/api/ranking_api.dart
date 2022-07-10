import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/ranking_model.dart';

class UserRankingAPI{

  Future getUserRanking() async{
    
    final Dio dio = Dio();
    const baseUrl = "http://8.219.84.81/api/v1/user/ranking";
    // List<RankingModel> rankingUser = [];
    try{
      final Response response = await dio.get(baseUrl);
      final rankingUser = RankingModel.fromJson(response.data['data']);
      // final content = response.data['data']['content'];
      // print(content[0]);
      return rankingUser.content;
    }on DioError catch(e){
      print(e.response!.statusCode);
    }
    
  }
} 