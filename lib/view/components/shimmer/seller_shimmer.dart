import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SellerShimmer extends StatelessWidget {
  const SellerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6, // Placeholder count for shimmer effect
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 8, right: 8, bottom: 14),
              child: Card(
                elevation: 4,
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Same color as baseColor
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
