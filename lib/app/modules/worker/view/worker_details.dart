import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/small_text.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/app/modules/worker/view/worker_review_card.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/utils/constants.dart';
import '../../../../utils/app_Images.dart';
import '../../../models/worker_model.dart';

class WorkerDetailsScreen extends BaseView<WorkerController> {
  const WorkerDetailsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: LightThemeColors.primaryColor,
      centerTitle: true,
      title: Image.asset(
        'assets/images/manpower_name_logo.png',
        fit: BoxFit.cover,
        color: Colors.white,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    WorkerModel worker = Get.arguments;
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: screenWidth * 0.6, // 60% of screen width
                        height: screenHeight * 0.25, // 30% of screen height
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: '${Constants.avatarImgUrl}${worker.avatar}',
                          errorWidget: (context, url, error) =>
                              Image.asset(AppImages.instance.imgPerson,fit: BoxFit.cover,),
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "${worker.firstName} ${worker.lastName}",
                      style: const TextStyle(
                        fontSize: 26,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          itemSize: 30,
                          initialRating: worker.ratings!.toDouble(),
                          minRating: 0.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                        Text(
                          "(${worker.ratings!})",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customInfoItem(context, title:"Address",value:'${worker.emergencyContract==null?"Empty":worker.emergencyContract!.address}'),
                          customInfoItem(context, title:"Gender",value:worker.gender??"Empty"),
                          customInfoItem(context, title:"Blood Group",value:worker.bloodGroup??"Empty"),
                          customInfoItem(context, title:"BirthDate",value:worker.birthday??"Empty"),
                          customInfoItem(context, title:"Meraital Status",value:worker.relationship??"Empty"),
                          customInfoItem(context, title:"Religion",value:worker.religion??"Empty"),
                          customInfoItem(context, title:"Nationality",value:worker.nationality??"Empty"),
                          SizedBox(width: screenHeight * .01),
                          const SizedBox(height: 10),
                          const Text(
                            'NID Number  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            '${worker.nidNumber}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Working Area',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Wrap(
                            children:
                                List.generate(worker.services!.length, (index) {
                              var services = worker.services![index];
                              return Chip(
                                  elevation: 5,
                                  label: Row(
                                    children: [
                                      Text(
                                        '${services.service!.name}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.green[100]);

                              Text('${services.service!.name}, ',
                                  style: const TextStyle(fontSize: 16));
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                    Center(
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.displayMedium?.color,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    worker.services!.first.service!.reviews!.isEmpty
                        ?  SmallText(text: "There is no review")
                        : Column(
                            children: List.generate(
                            worker.services!.first.service!.reviews!.length,
                            (index) {
                              var review = worker
                                  .services!.first.service!.reviews![index];

                              return WorkerReviewCard(review: review);
                            },
                          )),
                    SizedBox(height: screenHeight * .1),
                  ],
                ),
              ),
            )
          ]),
          Positioned(
            bottom: 5,
            left: 40,
            right: 40,
            child: Card(
              elevation: 9,
              // color: Colors.green.withOpacity(.85),
              child: SizedBox(
                height: screenHeight * .05,
                width: screenWidth * .6,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: const Text('Reserve Worker',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (controller.selectedWorkerList.isNotEmpty) {
                      controller.selectedWorkerList.clear();
                    }
                    if (controller.selectedWorkerList.isEmpty) {
                      Get.offNamed(AppPages.CheckoutScreen);
                      controller.addWorker(worker);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customInfoItem(BuildContext context,{required String value,required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:  ',
          style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall?.color,
              fontSize: 16),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
