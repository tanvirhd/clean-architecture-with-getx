import 'package:cleanwithgetx/config/color/app_color.dart';
import 'package:cleanwithgetx/config/textstyle/app_text_style.dart';
import 'package:cleanwithgetx/feature/favourite/favourite_page.dart';
import 'package:cleanwithgetx/feature/home/home_page_controller.dart';
import 'package:cleanwithgetx/feature/order/presentation/pages/order_list_page.dart';
import 'package:cleanwithgetx/feature/search/search_page.dart';
import 'package:cleanwithgetx/feature/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomePageController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => getWidget(controller.currentIndex.value)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) => controller.changePage(index),
        currentIndex: controller.currentIndex.value,
        backgroundColor: AppColor.colorFFFFFF,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        unselectedLabelStyle: AppTextStyle.textStyleMediumW50014.copyWith(color: AppColor.colorAEAEAE),
        selectedLabelStyle: AppTextStyle.textStyleMediumW50014.copyWith(color: AppColor.color000000),
        items: [
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(Icons.home, size: 20.0,),
              ),
              label: 'Home',
              backgroundColor: AppColor.color1A3F6D
          ),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.search,
                  size: 20.0,
                ),
              ),
              label: 'Search',
              backgroundColor: AppColor.color1A3F6D
          ),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.favorite,
                  size: 20.0,
                ),
              ),
              label: 'Favourite',
              backgroundColor: AppColor.color1A3F6D
          ),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.settings,
                  size: 20.0,
                ),
              ),
              label: 'Setting',
              backgroundColor: AppColor.color1A3F6D
          ),
        ],
      )),
    );
  }

Widget getWidget(int index){
    switch(index){
      case 0:
        return OrderListPage();
      case 1:
        return SearchPage();
      case 2:
        return FavouritePage();
      case 3:
        return SettingPage();
      default:
        return const SizedBox();
    }
  }
}
