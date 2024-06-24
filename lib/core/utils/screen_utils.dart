
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';

class ScreenUtils{
  static final ScreenUtils _instance = ScreenUtils._internal();
  ScreenUtils._internal();
  factory ScreenUtils() {
    return _instance;
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  Size getScreenSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }


  hideKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  unFocusKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  postFrameCallback(Function call){
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      call();
    });
  }
}