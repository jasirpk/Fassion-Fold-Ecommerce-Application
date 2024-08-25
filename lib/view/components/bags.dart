import 'package:cached_network_image/cached_network_image.dart';
import 'package:fassion_fold/model/hive/model.dart';
import 'package:fassion_fold/view/components/quantity.dart';
import 'package:fassion_fold/view_model/quantity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class BagsWidget extends StatelessWidget {
  const BagsWidget({
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(16),
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
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                box.delete(product.key);
                              },
                              icon: Icon(
                                IconlyLight.delete,
                                size: 30,
                              )),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "€${product.price}",
                        style: TextStyle(
                            fontSize: screenHeight * 0.020, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text(
                            '60,00',
                            style: TextStyle(
                                fontSize: screenHeight * 0.022,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '20% OFF',
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'XL/Beige',
                            style: TextStyle(
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Qty:',
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 10),
                          QuantityWidget(
                            icon: Icons.remove,
                            onpressed: () {
                              context.read<QuantityCount>().decrement();
                            },
                          ),
                          SizedBox(width: 10),
                          Text(
                            context.watch<QuantityCount>().quantity.toString(),
                            style: TextStyle(
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10),
                          QuantityWidget(
                            icon: Icons.add,
                            onpressed: () {
                              context.read<QuantityCount>().increment();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
