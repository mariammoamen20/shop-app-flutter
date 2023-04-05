import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData(
      {required String url,
      required Map<String,dynamic> data,
      Map<String, dynamic>? queryParameters,
      String? token,
      }) async {
    dio.options.headers={
      'lang': 'ar',
      'Content-Type': 'application/json',
      'Authorization': token ?? " "
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );

  }
  static Future<Response> getData(
      {
        required String url,
         dynamic data,
        Map<String, dynamic>? queryParameters,
        String? token,
      }) async {
    dio.options.headers={
      'lang': 'ar',
      'Content-Type': 'application/json',
      'Authorization': token ?? " "
    };
    return await dio.get(
      url,
      data: data,
      queryParameters: queryParameters,
    );

  }
}
