
import 'package:cleanwithgetx/core/failure/failure.dart';
import 'package:cleanwithgetx/core/usecase/use_case.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:cleanwithgetx/feature/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OrderDetailsUseCase extends UseCase<ModelOrder,InputParam>{
  OrderRepository repository;
  OrderDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, ModelOrder>> execute(InputParam inputParams) {
    return repository.getOrderDetailsById(orderId: inputParams.orderId,cancelToken: inputParams.cancelToken);
  }

}

class InputParam{
  String orderId;
  CancelToken cancelToken;
  InputParam({required this.cancelToken, required this.orderId});
}