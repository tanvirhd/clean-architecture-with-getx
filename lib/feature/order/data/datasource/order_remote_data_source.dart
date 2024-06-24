import 'dart:convert';
import 'package:cleanwithgetx/core/dio/api_end_points.dart';
import 'package:cleanwithgetx/core/dio/dio_helper.dart';
import 'package:cleanwithgetx/core/model/base_response.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

abstract class OrderRemoteDataSource {
  Future<List<ModelOrder>> getOrdersByClientId({required String clientId,CancelToken? cancelToken});
  Future<ModelOrder> getOrderDetailsById({required String orderId,CancelToken? cancelToken});
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource{
  @override
  Future<ModelOrder> getOrderDetailsById({required String orderId, CancelToken? cancelToken}) async {
    Map<String,dynamic> queryParam = {
      "deliveryRequestId" : orderId
    };
    final response = await DioHelper().get(dio: Get.find<Dio>(), url: ApiEndPoints.ORDER_DETAILS,cancelToken: cancelToken,queryParam: queryParam);
    final parsedResponse = BaseResponse<ModelOrder>.parseAsObject(jsonDecode(response.data), ModelOrder.fromJson);
    return parsedResponse.data as ModelOrder;
  }

  @override
  Future<List<ModelOrder>> getOrdersByClientId({required String clientId, CancelToken? cancelToken}) async {
    Map<String,dynamic> queryParam = {
      "clientid" : clientId
    };
    final response = await DioHelper().get(dio: Get.find<Dio>(), url: ApiEndPoints.ORDER_LIST,cancelToken: cancelToken,queryParam: queryParam);
    final parsedResponse = BaseResponse<ModelOrder>.parseAsList(jsonDecode(response.data), ModelOrder.fromJson);
    return parsedResponse.data as List<ModelOrder>;
  }

}