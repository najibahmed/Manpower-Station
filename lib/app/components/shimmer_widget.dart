import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({super.key,
    required this.height,
    this.width=double.infinity
  }) : shapeBorder = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)));
  
   const ShimmerWidget.circular({super.key,
    required this.height,
    required this.width,
     this.shapeBorder= const CircleBorder()
  }) ;

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey,
          shape: shapeBorder,

        ),
      ),
    );
  }
}
