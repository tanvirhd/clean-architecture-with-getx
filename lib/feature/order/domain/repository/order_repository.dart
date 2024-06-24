import 'package:cleanwithgetx/core/failure/failure.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class OrderRepository{
  Future<Either<Failure,List<ModelOrder>>> getOrdersByClientId({required String clientId,CancelToken? cancelToken});
  Future<Either<Failure,ModelOrder>> getOrderDetailsById({required String orderId,CancelToken? cancelToken});
}