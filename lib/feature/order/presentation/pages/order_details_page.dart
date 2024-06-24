import 'package:cleanwithgetx/config/color/app_color.dart';
import 'package:cleanwithgetx/config/textstyle/app_text_style.dart';
import 'package:cleanwithgetx/core/emun/status.dart';
import 'package:cleanwithgetx/core/utils/screen_utils.dart';
import 'package:cleanwithgetx/core/widgets/center_positioned.dart';
import 'package:cleanwithgetx/core/widgets/widget_loading.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:cleanwithgetx/feature/order/presentation/controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = ScreenUtils().getScreenSize(context);
    OrderDetailsController controller = Get.find<OrderDetailsController>();
    String? args = Get.arguments["orderId"];
    controller.fetchOrderDetails(orderId: args ?? "");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.color034EA2,
          title: Text("Order Details",style: AppTextStyle.textStyleSemiBoldW60022.copyWith(color: AppColor.colorFFFFFF)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: AppColor.colorFFFFFF),
            onPressed: () => Get.back(),
          ),
        ),
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: size.height,
              width: size.width,
              child: Obx((){
                if(controller.orderStatus == Status.success){
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: controller.orderDetails == null ? const SizedBox() : _orderDetails(size: size, order: controller.orderDetails!),
                  );
                }else if(controller.orderStatus == Status.error && controller.orderDetailsErrorMessage.isNotEmpty){
                  return Center(child: Text(controller.orderDetailsErrorMessage,style: AppTextStyle.textStyleRegularW40016.copyWith(color: AppColor.color000000)));
                }else return SizedBox();
              }),
            ),
            Obx(() {
              if(controller.orderStatus == Status.loading){
                return CenterPositioned(
                  child: WidgetLoading(width: size.width, height: size.height),
                );
              }else {
                return SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }

  _orderDetails({required Size size,required ModelOrder order}){
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: <Widget>[
          Text("Order ID : ${order.deliveryRequestId}",style: AppTextStyle.textStyleSemiBoldW60016.copyWith(color: AppColor.color000000)),
          Text("Customer Name : ${order.customerName}"),
          Text("Customer contact : ${order.customerNumber}"),
          Text("Pickup address : ${order.pickUpAddress}"),
          Text("Pickup Charge : ${order.pickupCharge}tk"),
          Text("Delivery Charge: ${order.deliveryCharge}tk"),
          Text("Pickup Code: ${order.pickupCode}"),
        ],
      ),
    );
  }
}
