// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';



class ReviewsScreen extends StatelessWidget {
  ServiceModel service;
   ReviewsScreen({super.key,required this.service});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reviews Header Section
              // Text(
              //   'Reviews',
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     _buildStarRating(5),
              //     SizedBox(width: 8),
              //     Text('(4.6)', style: TextStyle(fontSize: 16)),
              //     Spacer(),
              //     TextButton(
              //       onPressed: () {
              //         // Navigate to all reviews or write a review
              //       },
              //       child: Text('645 Reviews'),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 8),
              // Text(
              //   '4.65 out of 5',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 8,),
              _buildRatingBars(),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Give a review',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.black12
                     )
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Add write review functionality
                },
                child: const Text('Submit',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              service.reviews!.length ==0 ? const Text("There is no review"): Column(
                children: List.generate(reviewData.length, (index) {
                  var review=service.reviews![index];
                  return ReviewCard(review: reviewData[index],reviews:review);
                },)
              )
            ],
          ),
        ),
    );
  }

  // Function to build star ratings
  Widget _buildStarRating(int stars) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < stars ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }

  // Rating bars to visualize rating breakdown
  Widget _buildRatingBars() {
    return Column(
      children: [
        _buildRatingBar(5, 0.8),
        _buildRatingBar(4, 0.6),
        _buildRatingBar(3, 0.4),
        _buildRatingBar(2, 0.2),
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
  final Review review;
  final reviews;
   ReviewCard({super.key, required this.review, required this.reviews});

  @override
  Widget build(BuildContext context) {
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
                _buildStarRating(review.rating),
                const SizedBox(width: 8),
                Text(
                  review.author,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.date,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              review.isVerified ? 'Verified purchase' : '',
              style: const TextStyle(color: Colors.green),
            ),
            const SizedBox(height: 8),
            Text(
              reviews,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build star ratings within the review card
  Widget _buildStarRating(int stars) {
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

// Dummy data for reviews
class Review {
  final int rating;
  final String author;
  final String date;
  final bool isVerified;
  final String comment;

  Review({
    required this.rating,
    required this.author,
    required this.date,
    required this.isVerified,
    required this.comment,
  });
}

// Sample review data
List<Review> reviewData = [
  Review(
    rating: 5,
    author: 'Vin Gough',
    date: 'November 18, 2024 at 15:35',
    isVerified: true,
    comment:
    'My old IMAC was from 2013. This replacement was well needed. Very fast, and the colour matches my office set up perfectly.',
  ),
  Review(
    rating: 4,
    author: 'Sarah Lee',
    date: 'November 19, 2024 at 12:20',
    isVerified: true,
    comment:
    'Great product, but the shipping took longer than expected.',
  ),Review(
    rating: 4,
    author: 'Sarah Lee',
    date: 'November 19, 2024 at 12:20',
    isVerified: true,
    comment:
    'Great product, but the shipping took longer than expected.',
  ),Review(
    rating: 4,
    author: 'Sarah Lee',
    date: 'November 19, 2024 at 12:20',
    isVerified: true,
    comment:
    'Great product, but the shipping took longer than expected.',
  ),Review(
    rating: 4,
    author: 'Sarah Lee',
    date: 'November 19, 2024 at 12:20',
    isVerified: true,
    comment:
    'Great product, but the shipping took longer than expected.',
  ),
  // Add more reviews here
];
