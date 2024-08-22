import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerShimmer extends StatelessWidget {
  final double screenHeight;

  const BannerShimmer({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        elevation: 4,
        child: Container(
          height: screenHeight * 0.5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300], // Same color as baseColor
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
