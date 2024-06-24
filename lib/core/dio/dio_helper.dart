
import 'dart:convert';
import 'package:cleanwithgetx/config/constants/app_constant.dart';
import 'package:cleanwithgetx/core/dio/app_interceptor.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class DioHelper {
  CancelToken? _cancelToken;
  CancelToken? getCancelToken() => _cancelToken;

  Dio createDioInstance(){
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: TIMEOUT_TIME,
      receiveTimeout: TIMEOUT_TIME,
      baseUrl:  BASE_URL,
      responseType: ResponseType.plain,
    );
    var dio =  Dio(baseOptions);
    dio.interceptors.add(AppInterceptor());
    return dio;
  }


  Future<Response> post({
    required Dio dio,
    required String url,
    Map<String,dynamic>? queryParam,
    Map<String,dynamic>? data,
    CancelToken? cancelToken
  }){
    return dio.post(url,data: jsonEncode(data),queryParameters: queryParam,cancelToken: cancelToken ?? _cancelToken);
  }

  Future<Response> get({
    required Dio dio,
    required String url,
    Map<String,dynamic>? queryParam,
    CancelToken? cancelToken
  }){
    return dio.get(url,queryParameters: queryParam,cancelToken: cancelToken ?? _cancelToken);
  }

  Future<Response> put({
    required Dio dio,
    required String url,
    Map<String,dynamic>? queryParam,
    Map<String,dynamic>? data,
    CancelToken? cancelToken
  }){
    return dio.put(url,data: jsonEncode(data),queryParameters: queryParam,cancelToken: cancelToken ?? _cancelToken);
  }

  cancelApiCall({CancelToken? cancelToken}){
    if(cancelToken == null) _cancelToken?.cancel();
    else cancelToken.cancel();
  }

  Future<bool> isInternetAvailable() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return  ((connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi));
  }

  Future<RequestOptions> setHeaders(RequestOptions options) async {
    //add header to request option
    options.headers["Content-Type"] = "application/json";
    options.headers["Accept-Language"] = "en";
    return options;
  }

/*  Future<Response?> refreshToken() async {
    var dio =  Dio(BaseOptions(
      connectTimeout: TIMEOUT_TIME,
      receiveTimeout: TIMEOUT_TIME,
      baseUrl:  BASE_URL,
      responseType: ResponseType.plain,
    ));
    dio.interceptors.add(RefreshTokenInterceptor());
    String? rToken = await SharedPreferenceHelper().getEncryptedString(REFRESH_TOKEN);
    if( rToken != null && rToken.isNotEmpty){
      try{
        final response = await dio.post(loginRefreshEndPoint, data: {'refresh_token': rToken});
        return response;
      }catch(e){
        if(e is DioError && e.response != null){
          return e.response;
        }else return null;
      }
    } else {
      return Response(
        requestOptions: RequestOptions(path: loginRefreshEndPoint),
        data: jsonEncode({"message":"Invalid refresh token"}),
        statusCode: 400,
      );
    }
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions, Dio dio) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options
    );
  }*/

}
