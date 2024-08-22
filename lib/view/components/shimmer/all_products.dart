import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllProductsShimmer extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const AllProductsShimmer(
      {super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Simulating 5 loading items
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: screenWidth * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Same as baseColor
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: screenWidth * 0.4,
                      height: 20,
                      color: Colors.grey[300], // Placeholder text
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: screenWidth * 0.3,
                      height: 20,
                      color: Colors.grey[300], // Placeholder price
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
