import 'package:cached_network_image/cached_network_image.dart';
import 'package:fassion_fold/model/entitties/all_products.dart';
import 'package:fassion_fold/view/components/shimmer/all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProdutsWidget extends StatelessWidget {
  const AllProdutsWidget({
    super.key,
    required this.allCategories,
    required this.screenHeight,
    required this.screenWidth,
  });

  final Future<List<AllProductsModel>> allCategories;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AllProductsModel?>>(
      future: allCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AllProductsShimmer(
              screenHeight: screenHeight, screenWidth: screenWidth);
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          final categories = snapshot.data!;
          return SizedBox(
            height: screenHeight * 0.40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Container(
                    width: screenWidth * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: category!.image,
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                fit: BoxFit.cover,
                                width: screenWidth * 0.5,
                                height: screenHeight * 0.3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      CupertinoIcons.heart,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            category.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: 'JacquesFrancois',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          "€${category.price.toString()}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: Text('No data Available'),
          );
        }
      },
    );
  }
}
