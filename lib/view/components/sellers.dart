import 'package:cached_network_image/cached_network_image.dart';
import 'package:fassion_fold/model/entitties/relavent_products.dart';
import 'package:fassion_fold/view/components/shimmer/seller_shimmer.dart';
import 'package:flutter/material.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
    required Future<List<BestSellerModel>> sellerDetails,
  }) : _sellerDetails = sellerDetails;

  final Future<List<BestSellerModel>> _sellerDetails;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BestSellerModel>>(
      future: _sellerDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SellerShimmer();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final sellers = snapshot.data!;
          return SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                var seller = sellers[index];
                return Padding(
                  padding: EdgeInsets.only(top: 8, right: 8, bottom: 14),
                  child: Card(
                    elevation: 4,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: seller.image,
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
                            width: 120,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.black.withOpacity(0.2),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                seller.text,
                                style: TextStyle(
                                  fontFamily: 'JacquesFracois',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
