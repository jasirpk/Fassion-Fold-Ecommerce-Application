import 'package:cached_network_image/cached_network_image.dart';
import 'package:fassion_fold/view/components/shimmer/banner_shimmer.dart';
import 'package:fassion_fold/model/entitties/banner.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.banner,
    required this.screenHeight,
  });

  final Future<BannerModel?> banner;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BannerModel?>(
      future: banner,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return BannerShimmer(screenHeight: screenHeight);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          final banner = snapshot.data!;
          return Card(
              elevation: 4,
              child: Container(
                height: screenHeight * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: banner.image,
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          banner.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'JacquesFracois',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        } else {
          return Center(
            child: Text('No Banner available'),
          );
        }
      },
    );
  }
}
