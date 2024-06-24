
import 'dart:developer';
import 'package:cleanwithgetx/core/dio/dio_helper.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends QueuedInterceptorsWrapper{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log("---> API URL (AppInterceptor): ${options.uri}");
    log("---> REQUEST BODY (AppInterceptor): ${options.data}");

    //provide necessary headers
    RequestOptions requestOption = await DioHelper().setHeaders(options);
    log("---> REQUEST HEADER(AppInterceptor): ${requestOption.headers}");

    if(await DioHelper().isInternetAvailable()){
      //has internet
      super.onRequest(requestOption, handler);
    }else{
      //no internet
      handler.reject(DioError(requestOptions: options,type: DioErrorType.other,error: "You are offline!"));
    }

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("<--- API URL(AppInterceptor): ${response.realUri}");
    log("<--- RESPONSE BODY(AppInterceptor): ${response.data}");
    super.onResponse(response, handler);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("-^-^-> ERROR(status)(AppInterceptor): ${err.response?.statusCode}");
    log("-^-^-> ERROR(type)(AppInterceptor): ${err.type}");
    log("-^-^-> ERROR(message)(AppInterceptor): ${err.message}");
    log("-^-^-> ERROR(response)(AppInterceptor): ${err.response}");
    super.onError(err, handler);
  }
}