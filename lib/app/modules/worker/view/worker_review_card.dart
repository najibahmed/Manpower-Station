import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';
import 'package:manpower_station/utils/constants.dart';

class WorkerReviewCard extends StatelessWidget {
  final review;

  const WorkerReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkerController());
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 0.0,
                  minRating: 0.0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) =>
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    controller.userRating.value = rating;
                  },
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 160,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    review.user ?? 'Undefined',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(Constants.formatDate.format(DateTime.parse( review.date!)),
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            // Text(
            //   review.isVerified ? 'Verified purchase' : '',
            //   style: const TextStyle(color: Colors.green),
            // ),
            const SizedBox(height: 8),
            Text(
              review.comment.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
