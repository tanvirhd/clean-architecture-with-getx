
import 'dart:developer';
import 'package:cleanwithgetx/core/failure/failure.dart';
import 'package:cleanwithgetx/feature/order/data/datasource/order_local_data_source.dart';
import 'package:cleanwithgetx/feature/order/data/datasource/order_remote_data_source.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:cleanwithgetx/feature/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/cancel_token.dart';

class OrderRepositoryImplementation implements OrderRepository{
  OrderRemoteDataSource remoteDataSource;
  OrderLocalDataSource localDataSource;

  OrderRepositoryImplementation({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, ModelOrder>> getOrderDetailsById({required String orderId, CancelToken? cancelToken}) async {
    try{
      var response = await remoteDataSource.getOrderDetailsById(cancelToken: cancelToken,orderId: orderId);
      return Right(response);
    }catch(error,stackTrace){
      log("error: ${error.toString()} \n ${stackTrace.toString()}");
      Failure failure;
      if(error is  DioError) failure =  Failure(errorDescription: error.response?.statusMessage ?? error.message);
      else failure = Failure(errorDescription: error.toString());
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<ModelOrder>>> getOrdersByClientId({required String clientId, CancelToken? cancelToken}) async {
    try{
      var response = await remoteDataSource.getOrdersByClientId(cancelToken: cancelToken,clientId: clientId);
      return Right(response);
    }catch(error,stackTrace){
      log("error: ${error.toString()} \n ${stackTrace.toString()}");
      Failure failure;
      if(error is  DioError) failure =  Failure(errorDescription: error.response?.statusMessage ?? error.message);
      else failure = Failure(errorDescription: error.toString());
      return Left(failure);
    }
  }

}