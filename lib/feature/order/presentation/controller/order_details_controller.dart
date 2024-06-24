import 'package:cleanwithgetx/core/dio/dio_helper.dart';
import 'package:cleanwithgetx/core/emun/status.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:cleanwithgetx/feature/order/domain/usecase/order_details_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderDetailsController extends GetxController{

  CancelToken? cancelToken;
  OrderDetailsUseCase orderDetailsUseCase;
  OrderDetailsController({required this.orderDetailsUseCase});

  final Rx<Status> _orderStatus = Status.initial.obs;
  ModelOrder? _orderDetails;

  Rx<Status> get orderStatus => _orderStatus;
  ModelOrder? get orderDetails => _orderDetails;
  String orderDetailsErrorMessage = "";


  Future<void> fetchOrderDetails({required String orderId}) async {
    cancelToken = CancelToken();
    _orderStatus.value = Status.loading;
    final result = await orderDetailsUseCase.execute(InputParam(cancelToken: cancelToken!, orderId: orderId));
    result.fold(
        (failure) {
          _orderStatus.value = Status.error;
          orderDetailsErrorMessage = failure.errorDescription;
        },
        (result) {
          _orderStatus.value = Status.success;
          _orderDetails = result;
        }
    );
  }

  reset() {
    if(cancelToken!=null) DioHelper().cancelApiCall(cancelToken: cancelToken);
  }
}