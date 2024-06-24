import 'package:cleanwithgetx/config/color/app_color.dart';
import 'package:cleanwithgetx/config/textstyle/app_text_style.dart';
import 'package:cleanwithgetx/core/emun/status.dart';
import 'package:cleanwithgetx/core/routes/routes.dart';
import 'package:cleanwithgetx/core/utils/screen_utils.dart';
import 'package:cleanwithgetx/core/widgets/center_positioned.dart';
import 'package:cleanwithgetx/core/widgets/widget_loading.dart';
import 'package:cleanwithgetx/feature/order/data/model/model_order.dart';
import 'package:cleanwithgetx/feature/order/presentation/controller/order_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends StatelessWidget {
  OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = ScreenUtils().getScreenSize(context);
    OrderListController controller = Get.find<OrderListController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.color034EA2,
          title: Text("Orders",style: AppTextStyle.textStyleSemiBoldW60022.copyWith(color: AppColor.colorFFFFFF)),
          centerTitle: true,
          leading: const SizedBox()
        ),
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: size.height,
              width: size.width,
              child: Obx((){
                if(controller.orderStatus == Status.empty){
                  return Center(child: Text("you don't have any orders",style: AppTextStyle.textStyleRegularW40016.copyWith(color: AppColor.color000000)));
                }else if(controller.orderStatus == Status.success){
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListView.builder(
                      itemCount: controller.orders.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: () => _goToOrderDetailsPage(controller.orders[index].deliveryRequestId),
                          child: _singleOrder(controller.orders[index]));
                      },
                    ),
                  );
                }else if(controller.orderStatus == Status.error && controller.orderStatusErrorMessage.isNotEmpty){
                  return Center(child: Text("${controller.orderStatusErrorMessage}",style: AppTextStyle.textStyleRegularW40016.copyWith(color: AppColor.color000000)));
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


  _goToOrderDetailsPage(String? deliveryRequestId){
    Get.toNamed(AppRoutes.ORDER_DETAILS_PAGE,arguments: {"orderId" : deliveryRequestId});
  }

  Widget _singleOrder(ModelOrder order){
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16,bottom: 16),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColor.colorAEAEAE,width: 0.5)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Order ID : ${order.deliveryRequestId}",style: AppTextStyle.textStyleSemiBoldW60016.copyWith(color: AppColor.color000000)),
          Text("Customer Name : ${order.customerName}"),
          Text("Customer contact : ${order.customerNumber}"),
        ],
      ),
    );
  }
}
