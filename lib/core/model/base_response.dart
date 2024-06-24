import 'package:cleanwithgetx/core/model/basic_response.dart';

class BaseResponse<T> extends BasicResponse{
  Object? data;

  BaseResponse({
    required this.data,
    String? message,
    int? code
  }) : super (message: message,code: code);


  factory BaseResponse.parseAsList(Map<String,dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    List<T> parsedList = [];
    if (json['data'] != null) {
      for (int i = 0; i < json['data'].length; i++) {
        parsedList.add(fromJson(json['data'][i]));
      }
    }

    return BaseResponse(
        code: json['code'],
        message: json['message'],
        data: parsedList
    );
  }

  factory BaseResponse.parseAsObject(Map<String,dynamic> json, T Function(Map<String, dynamic>) fromJson) {
      return BaseResponse(
        code: json['code'],
        message: json['message'],
        data: json['data'] == null ? null : fromJson(json['data'])
      );
  }
}
