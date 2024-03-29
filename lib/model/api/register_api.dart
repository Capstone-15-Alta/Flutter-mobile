import 'package:dio/dio.dart';
import 'package:forum_diskusi/model/register_model.dart';

class RegisterAPI {
  final Dio dio = Dio();
  Future registerAuth(RegisterModel registerModel) async {
    try {
      final Response response = await dio.post(
        'http://8.219.84.81/api/v1/auth/register',
        data: registerModel.toJson(),
      );
      return response;
    } on DioError {
      // print(e.toString());
      rethrow;
    }
  }
}
