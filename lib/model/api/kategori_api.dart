// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:forum_diskusi/model/list_dropdown.dart';

// class KategoriAPI{
//   final Dio dio = Dio();
//   String baseUrl = 'http://34.87.190.0/api/v1/category';
//   Future getKategori() async {
//     try{
//       final Response response = await dio.get(
//       baseUrl
//     );
//     // var dataKategori = jsonDecode(response.body);
//     var dataKategori = response.data['data'] as List;
//     print(dataKategori);
//     }on DioError catch(e){
//       // print(e.toString());
//       print(e.response!.statusCode);
//     }
//   }
// }