import 'package:cleanwithgetx/core/dio/dio_helper.dart';
import 'package:cleanwithgetx/core/emun/status.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:cleanwithgetx/feature/order/domain/usecase/order_list_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderListController extends GetxController {

  CancelToken? cancelToken;

  OrderListUseCase orderListUseCase;

  OrderListController({required this.orderListUseCase});

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }


  final Rx<Status> _orderStatus = Status.initial.obs;
  final List<ModelOrder> _orders = [];

  Rx<Status> get orderStatus => _orderStatus;
  List<ModelOrder> get orders => _orders;
  String orderStatusErrorMessage = "";

  Future<void> fetchPosts() async {
    cancelToken = CancelToken();
    _orderStatus.value = Status.loading;
    final result = await orderListUseCase.execute(InputParam(cancelToken: cancelToken!, clientId: "01408500612"));
    result.fold(
        (failure) {
          _orderStatus.value = Status.error;
          orderStatusErrorMessage = failure.errorDescription;
        },
        (result) {
          if(result.isEmpty){
            _orderStatus.value = Status.empty;
            _orders.assignAll([]);
          }else{
            _orderStatus.value = Status.success;
            _orders.assignAll(result);
          }

        }
    );
  }

  reset() {
    if(cancelToken!=null) DioHelper().cancelApiCall(cancelToken: cancelToken);
  }
}

