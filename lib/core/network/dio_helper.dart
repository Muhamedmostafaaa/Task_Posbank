import 'package:dio/dio.dart';
import 'package:task_posbank/core/network/api_constants.dart';

abstract class BaseDioHelper {
  Future<Response>getData({required String path, Map<String,dynamic>query });
  Future<dynamic>postData({required String path, Map<String,dynamic>query,required dynamic data,  });

}
class DioHelper extends BaseDioHelper{
  Dio _dio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      responseBody: true,
    ));

    return dio;
  }
   @override
  Future<Response> getData({required String path, Map<String,dynamic>?query })async{

    return await _dio().get(path,queryParameters: query,);
  }

  @override
  Future<dynamic> postData({required String path,  Map<String, dynamic>? query, required dynamic data,})async {
   return await _dio().post(path,queryParameters: query,data: data,
      options: Options (
         validateStatus: (_) => true,
         contentType: Headers.jsonContentType,
         responseType:ResponseType.json,
       )
   );
  }




}