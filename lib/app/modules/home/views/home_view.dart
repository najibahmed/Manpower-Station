import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/big_text.dart';
import 'package:manpower_station/app/components/custom_loading_overlay.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/components/small_text.dart';
import 'package:manpower_station/app/models/category_model.dart';
import 'package:manpower_station/app/modules/bookings/controller/bookings_controller.dart';
import 'package:manpower_station/app/modules/home/views/horizontal_service_card.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:manpower_station/utils/helper_function.dart';
import '../../../../utils/app_Images.dart';
import '../../../components/custom_snackbar.dart';
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
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header of the screen with welcome message
                  // Wrap(
                  //   children: [
                  //     SizedBox(
                  //       height: 55.h,
                  //       width: 50.w,
                  //       child: CircleAvatar(
                  //         backgroundColor: Colors.grey.withOpacity(.30),
                  //         radius: 100,
                  //         child: const Icon(
                  //           Icons.person,
                  //           color: LightThemeColors.primaryColor,
                  //           size: 40,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 10.w,
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Hello!',
                  //           style: TextStyle(
                  //               fontSize: MyFonts.bodyMediumSize,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //         SizedBox(height: 2.h),
                  //         Text(
                  //           Strings.help.tr,
                  //           style: TextStyle(
                  //               fontSize: MyFonts.bodySmallTextSize,
                  //               color: Colors.black.withOpacity(.65),
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //         Text(
                  //           Strings.chooseService.tr,
                  //           style: TextStyle(
                  //               fontSize: MyFonts.bodyMediumSize,
                  //               color: Colors.black.withOpacity(.65),
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 10.h),
                  SizedBox(
                    height: 2.h,
                  ),

                  /// Application Banner
                  _buildBanner(size),

                  /// Popular Services Text
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Services',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        //   child: TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         'see all',
                        //         style: Theme.of(context).textTheme.bodyMedium),
                        // ),)
                      ],
                    ),
                  ),

                  /// Popular Services
                  _buildPopularService(size),

                  /// Category text message
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Text(
                      '${Strings.askTypeOfService.tr}?',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),

            ///Category Grid card
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.9,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.allCatData.isEmpty
                        ? 4
                        : controller.allCatData.length,
                    (context, index) {
                      if (controller.allCatData.isEmpty) {
                        return HelperFunction.instance
                            .buildServiceCardShimmer();
                      } else {
                        CategoryModel category = controller.allCatData[index];

                        ///build single Category card
                        return _buildCategoryCard(size, category, context);
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildCategoryCard(
      Size size, CategoryModel category, BuildContext context) {
    return InkWell(
        onTap: () async {
          if (await HelperFunction.instance.isInternetConnected()) {
            Get.toNamed(AppPages.SingleCateServicesScreen,
                arguments: [category.categoryName, category.id.toString()]);
          } else {
            CustomSnackBar.showCustomErrorToast(
                title: "No Internet!!",
                message: "Please check internet connection.");
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: CachedNetworkImage(
                  height: size.height * .13,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: '${Constants.categoryImgUrl}${category.frontImage}',
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.instance.categoryPlaceHolder,
                    fit: BoxFit.cover,
                  ),
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
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
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: size.height * 0.035,
                        width: size.width * 0.25,
                        child: OutlinedButton(
                            onPressed: () {
                              Get.toNamed(AppPages.SingleCateServicesScreen,
                                  arguments: [
                                    category.categoryName,
                                    category.id.toString()
                                  ]);
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color),
                            )),
                      ),
                    ],
                  )),
              // SizedBox(height: size.height * 0.01),
            ],
          ),
        ));
  }

  Widget _buildBanner(Size size) {
    return Card(
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: controller.allServiceData.isEmpty
              ? _buildBannerShimmer(size)
            : CarouselSlider(
                options: CarouselOptions(
                  height: size.height * 0.19,
                  autoPlay: true,
                  // enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(milliseconds: 300),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 1.0,
                ),
                items: controller.activeBanners.value.images != null
                    ? controller.activeBanners.value.images!.map((url) {
                        var banner = url.image;
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: '${Constants.bannerImgUrl}$banner',
                                errorWidget: (context, url, error) {
                                  // print(url);
                                  return const Icon(Icons.error);
                                },
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList()
                    : [
                        Container(
                          color: Colors.green.withOpacity(.04),
                        )
                      ],
              ),
      ),
    );
  }

  Center retryWidget(Size size) {
    return Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: size.height * .15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons
                              .signal_wifi_statusbar_connected_no_internet_4_outlined,
                          size: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "No Internet Connection",
                              size: 14,
                            ),
                            SmallText(
                                text:
                                    "Please check your internet and try again."),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  asyncFunction: _handleRefresh();
                                },
                                child: BigText(
                                  text: "Retry",
                                  color: Colors.white,
                                  size: 12,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
  }

  Future<void> _handleRefresh() async {
    if (!controller.refreshLoading.value) {
      controller.refreshLoading.value = true;
      Get.find<UserController>().getUserInformation();
      Get.find<BookingsController>().getAllBookingsByUid();
      controller.fetchAllService();
      controller.fetchAllCategories();
      // await controller.getAllServiceData();
      // await controller.getAllServiceCategories();
      controller.getBanners();
      controller.refreshLoading.value = false;
    }
  }

  Widget _buildPopularService(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: controller.allServiceData.isEmpty
          ? _buildPopularShimmer(size)
          : CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.2,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                viewportFraction: .55,
              ),
              items: controller.allServiceData.map((service) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppPages.ServiceDetails, arguments: service);
                  },
                  child: HorizontalServiceCard(
                    title: service.name!,
                    image: service.image!,
                    service: service,
                  ),
                );
              }).toList(),
            ),
    );
  }

  Widget _buildBannerShimmer(Size size) {
    if(!controller.connectionController.value.isInternetConnected.value){
      controller.retryButtonShow=true;
    }
    if(controller.showRetryButton){
      return retryWidget(size);
    }else{
      return Card(
          elevation: 5,
          child: SizedBox(
              width: double.maxFinite,
              child: ShimmerWidget.rectangular(
                height: size.height * .18,
              )));
    }
  }

  Widget _buildPopularShimmer(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
            elevation: 5,
            child: ShimmerWidget.rectangular(
              height: size.height * 0.16,
              width: size.width * .25,
            )),
        Card(
            elevation: 5,
            child: ShimmerWidget.rectangular(
              height: size.height * 0.18,
              width: size.width * .4,
            )),
        Card(
            elevation: 5,
            child: ShimmerWidget.rectangular(
              height: size.height * 0.16,
              width: size.width * .25,
            )),
      ],
    );
  }
}
