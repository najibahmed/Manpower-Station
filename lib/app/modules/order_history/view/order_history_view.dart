import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/order_history/controller/order_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';

class OrderHistoryView extends BaseView<OrderController> {
  const OrderHistoryView({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      centerTitle: true,
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      title: Text(
        'Order History',
        style: TextStyle(
          fontSize: MyFonts.appBarTittleSize,
        ),
      ),
      bottom:  PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          child: TabBar(
            indicatorColor: Colors.green,
            labelStyle: TextStyle(color: Colors.green),
            controller: controller.tabController,
            tabs: const [
              Tab(text: 'Active Order'),
              Tab(text: 'Order History'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return Column(
      children: [
        SizedBox(
          height: 600,
          child: TabBarView(
            controller: controller.tabController,
            children: const [
              orderHistory(),
              orderHistory(),
            ],
          ),
        ),
      ],
    );
  }
}

class orderHistory extends StatelessWidget {
  const orderHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
            child: Center(
              child: Image.asset(
                'assets/images/no_order_history.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          Center(
              child: Text(
            Strings.noActiveHistory.tr,
            style: TextStyle(
              fontSize: MyFonts.displayMediumSize,
            ),
          ))
        ],
      ),
    );
  }
}
