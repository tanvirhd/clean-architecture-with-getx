
import 'package:cleanwithgetx/feature/order/data/repositoryimpl/order_repository_implementation.dart';
import 'package:cleanwithgetx/feature/order/domain/usecase/order_details_use_case.dart';
import 'package:cleanwithgetx/feature/order/presentation/controller/order_details_controller.dart';
import 'package:get/instance_manager.dart';

class OrderDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsUseCase(repository: Get.find<OrderRepositoryImplementation>()));
    Get.lazyPut(() => OrderDetailsController(orderDetailsUseCase: Get.find<OrderDetailsUseCase>()));
  }
}