import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/order_history/controller/order_controller.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';

import '../../../../config/theme/dark_theme_colors.dart';

class OrderHistoryView extends BaseView<OrderController> {
  const OrderHistoryView({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
      AppBar(
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor :LightThemeColors.backgroundColor,
      bottom:  PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: SizedBox(
          height: 40,
          child: TabBar(
            indicatorColor: Colors.green,
            labelStyle: const TextStyle(color: Colors.green),
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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white30,
            bottom:  PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  indicatorWeight: 6,
                  dividerColor: Colors.grey,
                  indicatorColor: Colors.green,
                  labelStyle: const TextStyle(color: Colors.green),
                  controller: controller.tabController,
                  tabs: const [
                    Tab(text: 'Active Order'),
                    Tab(text: 'Order History'),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: const [
                      ActiveOrder(),
                      OrderHistory(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Icon(Icons.assignment_turned_in, color: Colors.green, size: 40),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Order ID: #123456',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Maid Service. \nStarting Date: 30 July 2024',
                          style:
                          TextStyle(fontSize: MyFonts.bodySmallTextSize),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomButton(
                            title: 'View Order',
                            height: 35.h,
                            width: 120.w,
                            onTap: () {})
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/active_order.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OrderHistory extends StatelessWidget {
  const OrderHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
      ),
    );
  }

}