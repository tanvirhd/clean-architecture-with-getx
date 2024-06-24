import 'package:cleanwithgetx/app/app_bindings.dart';
import 'package:cleanwithgetx/config/color/app_color.dart';
import 'package:cleanwithgetx/core/routes/routes.dart';
import 'package:cleanwithgetx/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColor.color034EA2));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      initialBinding: AppBindings(),
      getPages: routes,
      initialRoute: AppRoutes.HOME_PAGE,
      builder: (context,child){
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
            child: child!
        );
      },
    );
  }
}