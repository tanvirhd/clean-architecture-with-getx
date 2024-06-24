import 'package:cleanwithgetx/core/failure/failure.dart';
import 'package:cleanwithgetx/core/usecase/use_case.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:cleanwithgetx/feature/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OrderListUseCase extends UseCase<List<ModelOrder>,InputParam>{
  OrderRepository repository;
  OrderListUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ModelOrder>>> execute(InputParam inputParams) {
    return repository.getOrdersByClientId(clientId: inputParams.clientId,cancelToken: inputParams.cancelToken);
  }
}

class InputParam{
  String clientId;
  CancelToken cancelToken;
  InputParam({required this.cancelToken, required this.clientId});
}