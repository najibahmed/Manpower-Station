import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/search_view/controller/search_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/app/modules/service/view/service_card.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/helper_function.dart';

class SearchScreen extends BaseView<SearchViewController> {
  const SearchScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: serviceSearchBar(context),
          ),
          serviceSearchGridList()
        ],
      ),
    );
  }

  SliverPadding serviceSearchGridList() {
    return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          sliver: controller.isLoading.value
              ? SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                  ),
                  delegate: SliverChildBuilderDelegate(childCount: 5,
                      (context, index) {
                    return HelperFunction.instance.buildServiceCardShimmer();
                  }))
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.71,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: controller.isLoading.value
                            ? 6
                            : controller.findByService.length,
                        (context, index) {
                          if (controller.isLoading.value) {
                            return HelperFunction.instance
                                .buildServiceCardShimmer();
                          } else {
                            ServiceModel service =
                                controller.findByService[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(AppPages.ServiceDetails,
                                    arguments: service);
                              },
                              child: ServiceCard(
                                title: service.name!,
                                image: service.image!,
                                service: service,
                              ),
                            );
                          }
                        },
                      )),
                ),
        );
  }

  Container serviceSearchBar(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height * 0.075,
            color: LightThemeColors.primaryColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextField(
                onTapOutside: (_){
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: controller.searchController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration:  InputDecoration(
                  hintText: 'Search Service',
                  hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.7)
                  ),
                  filled: true,
                  isDense: true,
                  prefixIcon: Icon(Icons.search_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                ),
                onChanged: (query) {
                  controller.deBouncer.call(() {
                    // if (controller.searchController.text.isNotEmpty) {
                    controller.isLoading.value = true;
                    controller.findServices();
                    Future.delayed(
                        const Duration(
                          seconds: 1,
                        ), () {
                      controller.isLoading.value = false;
                    });
                    // }
                  });
                },
              ),
            ),
          );
  }
}
