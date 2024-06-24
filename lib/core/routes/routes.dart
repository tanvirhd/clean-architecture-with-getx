import 'package:cleanwithgetx/feature/favourite/favourite_page.dart';
import 'package:cleanwithgetx/feature/home/home_page.dart';
import 'package:cleanwithgetx/feature/order/presentation/binding/order_details_binding.dart';
import 'package:cleanwithgetx/feature/order/presentation/pages/order_details_page.dart';
import 'package:cleanwithgetx/feature/order/presentation/pages/order_list_page.dart';
import 'package:cleanwithgetx/feature/search/search_page.dart';
import 'package:cleanwithgetx/feature/setting/setting_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

final List<GetPage> routes =[
  GetPage(name: AppRoutes.HOME_PAGE, page: ()=> HomePage()),
  GetPage(name: AppRoutes.ORDER_LIST_PAGE, page: ()=> OrderListPage()),
  GetPage(name: AppRoutes.ORDER_DETAILS_PAGE, page: ()=> OrderDetailsPage(),binding: OrderDetailsBinding()),
  GetPage(name: AppRoutes.FAVOURITE_PAGE, page: ()=> FavouritePage()),
  GetPage(name: AppRoutes.SETTING_PAGE, page: ()=> SettingPage()),
  GetPage(name: AppRoutes.SEARCH_PAGE, page: ()=> SearchPage()),
];

class AppRoutes {
  AppRoutes._();
  static const String HOME_PAGE = "/";
  static const String ORDER_DETAILS_PAGE = "/orderList";
  static const String ORDER_LIST_PAGE = "/orderDetails";
  static const String FAVOURITE_PAGE = "/favourite";
  static const String SETTING_PAGE = "/setting";
  static const String SEARCH_PAGE = "/search";
}