import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/modules/worker/controller/worker_controller.dart';

class WorkerReviewCard extends StatelessWidget {
  final  review ;
  const WorkerReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(WorkerController());
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
                _buildStarRating(review.rating!),
                const SizedBox(width: 8),
                Text(
                  review.user ?? 'Undefined',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RatingBar.builder(
                initialRating: 0.0,
                minRating: 0.0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  controller.userRating.value = rating;
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              review.date!,
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

  // Function to build star ratings within the review card
  Widget _buildStarRating(num stars) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < stars ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }
}