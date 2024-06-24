
import 'package:cleanwithgetx/config/color/app_color.dart';
import 'package:flutter/material.dart';

class WidgetLoading extends StatelessWidget{
  double height;
  double width;
  WidgetLoading({required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.black12.withOpacity(0.0),
      child: Center(
        child: ClipRRect(
          borderRadius:const BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            height: 180,
            width: 200,
            color:  Colors.transparent,
            child: const Center(
              child: CircularProgressIndicator(color: AppColor.color034EA2),
            ),
          ),
        ),
      ),
    );
  }
}