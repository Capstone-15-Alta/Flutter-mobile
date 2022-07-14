import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/list_dropdown.dart';

class KategoriAPI{
  final Dio dio = Dio();
  String baseUrl = 'http://8.219.84.81/api/v1/category';
  Future<KategoriModel?> getKategori() async {
    try{
      final Response response = await dio.get(
      baseUrl
    );
    var dataKategori = KategoriModel.fromJson(response.data);
    return dataKategori;
    }on DioError catch(e){
      // print(e.toString());
      return null;
      print(e.response!.statusCode);
    }
  }
}