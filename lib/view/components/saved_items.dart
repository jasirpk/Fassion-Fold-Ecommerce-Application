import 'package:cached_network_image/cached_network_image.dart';
import 'package:fassion_fold/model/hive/model.dart';
import 'package:fassion_fold/view/components/bag_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedItemsWidget extends StatelessWidget {
  const SavedItemsWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.product,
    required this.box,
  });

  final double screenHeight;
  final double screenWidth;
  final ProductsModel product;
  final Box<ProductsModel> box;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 8),
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.16,
                    width: screenWidth * 0.28,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.image,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
                          width: double.infinity,
                          height: screenHeight * 0.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            box.delete(product.key);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('item removed from saved items'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          icon: Icon(
                            IconlyLight.delete,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.price,
                      style: TextStyle(
                          fontSize: screenHeight * 0.020, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          '€ 60,00',
                          style: TextStyle(
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '20% OFF',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '€ 60,00',
                      style: TextStyle(
                          fontSize: screenHeight * 0.020,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    BagButtonWidget(
                        product: product, box: box, screenHeight: screenHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
