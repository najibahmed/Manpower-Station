import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/faq/controller/faq_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

class FaqView extends BaseView<FaqController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
        centerTitle: true,
        backgroundColor:
        Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
        title: Text(
          'FAQ',
          style: TextStyle(
              fontSize: MyFonts.appBarTittleSize,
              color: LightThemeColors.bodyTextColor,
              fontWeight: FontWeight.bold
          ),
        ));
  }

  @override
  Widget body(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) {
        return const Divider(thickness: 5,);
      },
      itemCount: controller.faqItems.length,
      itemBuilder: (context, index) {
      var  item=controller.faqItems[index];
      int indexItem = controller.faqItems.indexOf(item);
      return ExpansionPanelList(
        expandIconColor: LightThemeColors.primaryColor,
        elevation: 3,
        expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10),
        expansionCallback: (int e, bool isExpanded) {
          controller.toggleExpansion(indexItem);
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.question),
              );
            },
            body: ListTile(
              title: Text(item.answer,textAlign: TextAlign.justify,style: TextStyle(
                  fontSize: MyFonts.bodySmallTextSize
              ),),
            ),
            isExpanded: item.isExpanded,
          ),
        ],
      );
      },
    );
  }
}