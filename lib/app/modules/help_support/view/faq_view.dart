import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/help_support/controller/help_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

class FaqView extends BaseView<HelpController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: LightThemeColors.primaryColor,
            )),
        centerTitle: true,
        backgroundColor:
            Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
        title: Text(
          'FAQ',
          style: TextStyle(
              fontSize: MyFonts.appBarTittleSize,
              color: LightThemeColors.bodyTextColor,
              fontWeight: FontWeight.bold),
        ));
  }

  @override
  Widget body(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) {
        return  Divider(
          thickness: 2,
          color: Theme.of(context).dividerColor,
        );
      },
      itemCount: controller.faqItems.length,
      itemBuilder: (context, index) {
        var item = controller.faqItems[index];
        int indexItem = controller.faqItems.indexOf(item);
        return ExpansionPanelList(
          expandIconColor: LightThemeColors.primaryColor,
          elevation: 3,
          expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 10),
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
                title: Text(
                  item.answer,
                  textAlign: TextAlign.justify,
                  style:  Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              isExpanded: item.isExpanded,
            ),
          ],
        );
      },
    );
  }
}
