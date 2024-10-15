import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/models/category_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:manpower_station/utils/helper_function.dart';
import '../../../../config/translations/localization_service.dart';
import '../../../core/base/base_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: RefreshIndicator(
        color: Colors.green,
        onRefresh: _handleRefresh,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                leading: InkWell(
                  onTap: () => LocalizationService.updateLanguage(
                    LocalizationService.getCurrentLocal().languageCode == 'bn'
                        ? 'en'
                        : 'bn',
                  ),
                  child: SizedBox(
                    height: 30.h,
                    width: 30.h,
                    child: SvgPicture.asset(
                      'assets/vectors/language.svg',
                      color: LightThemeColors.primaryColor,
                      fit: BoxFit.none,
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
                title: Image.asset(
                  'assets/images/manpower_name_logo.png',
                  fit: BoxFit.cover,
                ),
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: ()async {
                            print('access token----${MySharedPref.getAccessToken()}');
                            print("refresh token---${await MySharedPref.getRefreshToken()}");
                            print("userId----${await MySharedPref.getUserId()}");
                          },
                          icon: const Icon(
                            Icons.notifications_active_outlined,
                            color: LightThemeColors.primaryColor,
                          )),
                      // InkWell(
                      //   onTap: () => MyTheme.changeTheme(),
                      //   child: SizedBox(
                      //     height: 39.h,
                      //     width: 39.h,
                      //     // decoration:
                      //     // theme.extension<HeaderContainerThemeData>()?.decoration,
                      //     child: SvgPicture.asset(
                      //       Get.isDarkMode
                      //           ? 'assets/vectors/sun.svg'
                      //           : 'assets/vectors/moon.svg',
                      //       fit: BoxFit.none,
                      //       color: Get.isDarkMode
                      //           ? LightThemeColors.backgroundColor
                      //           : DarkThemeColors.backgroundColor,
                      //       height: 10,
                      //       width: 10,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ]),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header of the screen with welcome message
                    Wrap(
                      children: [
                        SizedBox(
                          height: 55,
                          width: 55,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.30),
                            radius: 100,
                            child: const Icon(
                              Icons.person,
                              color: LightThemeColors.primaryColor,
                              size: 40,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello!',
                              style: TextStyle(
                                  fontSize: MyFonts.bodyMediumSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              Strings.help.tr,
                              style: TextStyle(
                                  fontSize: MyFonts.bodySmallTextSize,
                                  color: Colors.black.withOpacity(.65),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Strings.chooseService.tr,
                              style: TextStyle(
                                  fontSize: MyFonts.bodyMediumSize,
                                  color: Colors.black.withOpacity(.65),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                     SizedBox(height: 15.h),
                    /// Application Banner
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: controller.allServiceData.isEmpty
                          ? _buildBannerShimmer()
                          : CarouselSlider(
                              options: CarouselOptions(
                                height: size.height * 0.2,
                                autoPlay: true,
                                // enlargeCenterPage: true,
                                aspectRatio: 16 / 9,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                pauseAutoPlayOnTouch: true,
                                viewportFraction: 1.0,
                              ),
                              items: controller.activeBanners.value.images
                                  ?.map((url) {
                                var banner = url.image;
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Image.network(
                                        '${Constants.bannerImgUrl}$banner',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                    ),
                    SizedBox(height: 15.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Service Categories',
                    //       style: TextStyle(
                    //           fontSize: MyFonts.bodyLargeSize,
                    //           color: Colors.black.withOpacity(.65),
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //       child: TextButton(
                    //           onPressed: () {},
                    //           child: Text(
                    //             'see all',
                    //             style: TextStyle(
                    //                 fontSize: MyFonts.bodyLargeSize,
                    //                 color: Colors.black.withOpacity(.65),
                    //                 fontWeight: FontWeight.normal),
                    //           )),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 5.h),
                    // SizedBox(
                    //   height: 100,
                    //   child: controller.allCategoryData.isEmpty
                    //       ? ListView.builder(
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: 5,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             return _buildCategoryShimmer();
                    //           },
                    //         )
                    //       : ListView.builder(
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount:  controller.allCategoryData.length,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             CategoryModel category =
                    //                 controller.allCategoryData[index];
                    //             var id =category.id.toString();
                    //             return
                    //               ServiceOption(
                    //               label: category.categoryName!,
                    //               image: 'assets/images/maid_icon.png',
                    //               onTap: () {
                    //                  controller.getOneCategoryServices(id);
                    //                   var serviceList=controller.oneCategoryServicesData.value;
                    //                   Get.toNamed(AppPages.SingleCateServicesScreen,arguments: serviceList);
                    //
                    //               });
                    //           }),
                    // ),
                    // SizedBox(height: 10.h),
                    /// Category text message
                    Text(
                      '${Strings.askTypeOfService.tr}?',
                      style: TextStyle(
                          fontSize: MyFonts.bodyLargeSize,
                          color: Colors.black.withOpacity(.65),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.allCategoryData.isEmpty
                        ? 6
                        : controller.allCategoryData.length,
                    (context, index) {
                      if (controller.allCategoryData.isEmpty) {
                        return buildServiceCardShimmer();
                      } else {
                        var image=categoryImage[index];
                        CategoryModel category =
                            controller.allCategoryData[index];
                        var id = category.id.toString();
                              String catTitle=category.categoryName!;
                        return InkWell(
                            onTap: () {
                              controller.oneCategoryServicesData.clear();
                              controller.getOneCategoryServices(id);
                              var serviceList =
                                  controller.oneCategoryServicesData;
                              Get.toNamed(AppPages.SingleCateServicesScreen,
                                  arguments: [serviceList,catTitle]);
                            },
                            child: Card(
                              color: Colors.grey[50],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 4,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15)),
                                    child: Image.asset(
                                      image,
                                      height: size.height * 0.14,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      category.categoryName!,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  // Divider(color: Colors.black26,),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.035,
                                            width: size.width * 0.25,
                                            child: OutlinedButton(
                                                onPressed: () {
                                                   controller
                                                      .getOneCategoryServices(
                                                          id);
                                                  var serviceList = controller
                                                      .oneCategoryServicesData;
                                                  Get.toNamed(
                                                      AppPages
                                                          .SingleCateServicesScreen,
                                                      arguments: [serviceList,catTitle]);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  // backgroundColor:
                                                  //     LightThemeColors
                                                  //         .primaryColor,
                                                ),
                                                child: const Text(
                                                  'View All',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.green),
                                                )),
                                          ),
                                        ],
                                      )),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ));
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );

  }

  Future<void> _handleRefresh() async {
    controller.getAllServiceData();
    controller.getAllServiceCategories();
    controller.getActiveBanners();
    return Future.delayed(const Duration(seconds: 3));
  }

  Widget _buildBannerShimmer() {
    return const Card(
        elevation: 5,
        child: ShimmerWidget.rectangular(height: 180));
  }

}
