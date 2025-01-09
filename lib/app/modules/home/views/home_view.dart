import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/shimmer_widget.dart';
import 'package:manpower_station/app/models/category_model.dart';
import 'package:manpower_station/app/modules/home/views/horizontal_service_card.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:manpower_station/utils/helper_function.dart';
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
                  // SizedBox(
                  //   height: 8.h,
                  // ),
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
                        //         style: TextStyle(
                        //             fontSize: MyFonts.bodyLargeSize,
                        //             color: Colors.black.withOpacity(.65),
                        //             fontWeight: FontWeight.normal),
                        //       )),
                        // ),
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
                        return HelperFunction.instance
                            .buildServiceCardShimmer();
                      } else {
                        var image = categoryImage[index];
                        CategoryModel category =
                            controller.allCategoryData[index];
                        var id = category.id.toString();
                        String catTitle = category.categoryName!;

                        ///build single Category card
                        return _buildCategoryCard(
                            id, catTitle, image, size, category);
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
      String id, String catTitle, image, Size size, CategoryModel category) {
    return InkWell(
        onTap: () {
          controller.oneCategoryServicesData.clear();
          controller.getOneCategoryServices(id);
          Get.toNamed(AppPages.SingleCateServicesScreen,
              arguments: [catTitle, id]);
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.035,
                        width: size.width * 0.25,
                        child: OutlinedButton(
                            onPressed: () {
                              controller.getOneCategoryServices(id);
                              Get.toNamed(AppPages.SingleCateServicesScreen,
                                  arguments: [catTitle, id]);
                            },
                            child: const Text(
                              'View All',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green),
                            )),
                      ),
                    ],
                  )),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ));
  }

  Widget _buildBanner(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: controller.allServiceData.isEmpty
              ? _buildBannerShimmer()
              : CarouselSlider(
                  options: CarouselOptions(
                    height: size.height * 0.19,
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 6),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 300),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 1.0,
                  ),
                  items: controller.activeBanners.value.images?.map((url) {
                    var banner = url.image;
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: '${Constants.bannerImgUrl}$banner',
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
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
                  }).toList(),
                ),
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

  Widget _buildPopularService(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: controller.allServiceData.isEmpty
          ? _buildPopularShimmer(size)
          : CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.2,
                autoPlay: true,
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

  Widget _buildBannerShimmer() {
    return const Card(
        elevation: 5, child: ShimmerWidget.rectangular(height: 180));
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
