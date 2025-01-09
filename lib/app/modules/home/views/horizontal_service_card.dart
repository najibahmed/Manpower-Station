import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/utils/helper_function.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_fonts.dart';
import '../../../../utils/constants.dart';
import '../../../components/big_text.dart';

class HorizontalServiceCard extends StatelessWidget {
  final String title;
  final String image;
  final ServiceModel service;
  const HorizontalServiceCard(
      {super.key,
        required this.title,
        required this.image,
        required this.service});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child:CachedNetworkImage(
                    // height: size.height*.13,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl:
                    '${Constants.serviceImgUrl}$image',
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                    progressIndicatorBuilder:
                        (context, url, progress) => Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                  ),

                  // Image.network(
                  //   '${Constants.serviceImgUrl}$image',
                  //   height: 120,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    BigText(text: title,size:MyFonts.bodyLargeSize),
                     Text(
                      "(starting with)",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${Constants.banglaCurrency}"
                                "${HelperFunction.instance.getDiscountAmount(service.serviceDiscount,service.servicePrice!)} ",
                            style: const TextStyle(
                                fontSize: 18,
                                color: LightThemeColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          service.serviceDiscount?.discount==0 ?  const SizedBox():Text(
                            "${service.servicePrice} ",
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          service.serviceDiscount!.discount.toString()!='0'?
          Positioned(
              top: 10,
              right: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.85),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))
                ),
                height: 20,
                width: 80,
                child: Text(
                  textAlign: TextAlign.center,
                  '${service.serviceDiscount!.discount}'
                      '${service.serviceDiscount!.discountType == "Percentage Discount" ? '%' : Constants.banglaCurrency} OFF',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
              )):const SizedBox()
        ],
      ),
    );
  }
}
