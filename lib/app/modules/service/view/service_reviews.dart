// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/modules/service/controller/service_controller.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';
import 'package:manpower_station/utils/constants.dart';

class ReviewsScreen extends StatelessWidget {
  List<dynamic> reviews;
  ReviewsScreen({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ServiceController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 4,
            // ),
            // _buildRatingBars(),
            // const SizedBox(height: 8),
            // const Divider(color: Colors.black26,),
            // const SizedBox(height: 8),
            // const Text(
            //   "Reviews",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 8),
            reviews.isEmpty
                ? const Center(child: Text("There is no review",style: TextStyle(fontSize: 16),))
                : Column(
                    children: List.generate(
                    reviews.length,
                    (index) {
                      var review = reviews[index];
                      return ReviewCard(review: review);
                    },
                  ))
          ],
        ),
      ),
    );
  }

  // Rating bars to visualize rating breakdown
  Widget _buildRatingBars() {
    return Column(
      children: [
        _buildRatingBar(5, 0.8),
        _buildRatingBar(4, 0.6),
        _buildRatingBar(3, 0.2),
        _buildRatingBar(2, 0.1),
        _buildRatingBar(1, 0.1),
      ],
    );
  }

  // Rating bar widget
  Widget _buildRatingBar(int stars, double percentage) {
    return Row(
      children: [
        Text(stars.toString(), style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[300],
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}

// Custom widget for a review card
class ReviewCard extends StatelessWidget {
  final Reviews review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceController());
    return Card(
      color: Colors.grey[100],
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
                  itemSize: 25,
                  initialRating: 0.0,
                  minRating: 0.0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    size: 5,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    controller.userRating.value = rating;
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  review.user?.username ?? 'Undefined',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              Constants.formatDateTime.format(DateTime.parse(review.date!)),
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
