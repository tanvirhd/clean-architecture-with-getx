
class BasicResponse {
  int? code;
  String? message;

  BasicResponse({this.code, this.message});

  factory BasicResponse.fromJson(Map<String,dynamic> json) {
    return BasicResponse(
        code : json["code"] as int?,
        message : json["message"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    return map;
  }

  String toString(){
    return "code = $code message = $message";
  }
}
