import 'package:cleanwithgetx/config/constants/app_constant.dart';
import 'package:cleanwithgetx/core/dio/app_interceptor.dart';
import 'package:cleanwithgetx/feature/favourite/favourite_controller.dart';
import 'package:cleanwithgetx/feature/home/home_page_controller.dart';
import 'package:cleanwithgetx/feature/order/data/datasource/order_local_data_source.dart';
import 'package:cleanwithgetx/feature/order/data/datasource/order_remote_data_source.dart';
import 'package:cleanwithgetx/feature/order/data/repositoryimpl/order_repository_implementation.dart';
import 'package:cleanwithgetx/feature/order/domain/usecase/order_list_use_case.dart';
import 'package:cleanwithgetx/feature/order/presentation/controller/order_list_controller.dart';
import 'package:cleanwithgetx/feature/search/search_controller.dart';
import 'package:cleanwithgetx/feature/setting/setting_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class AppBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<Dio>(() {
      BaseOptions baseOptions = BaseOptions(
        connectTimeout: TIMEOUT_TIME,
        receiveTimeout: TIMEOUT_TIME,
        baseUrl: BASE_URL,
        responseType: ResponseType.plain,
      );
      var dio = Dio(baseOptions);
      dio.interceptors.add(AppInterceptor());
      return dio;
    });

    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => FavouriteController());

    Get.lazyPut(() => OrderRemoteDataSourceImpl(),fenix: true);
    Get.lazyPut(() => OrderLocalDataSourceImpl(),fenix: true);
    Get.lazyPut(() => OrderRepositoryImplementation(
        remoteDataSource: Get.find<OrderRemoteDataSourceImpl>(),
        localDataSource: Get.find<OrderLocalDataSourceImpl>()
    ),fenix: true);

    Get.lazyPut(() => OrderListUseCase(
        repository: Get.find<OrderRepositoryImplementation>()
    ));
    Get.lazyPut(() => OrderListController(
        orderListUseCase: Get.find<OrderListUseCase>()
    ));
  }

}
