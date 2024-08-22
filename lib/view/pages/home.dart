import 'package:fassion_fold/common/assings.dart';
import 'package:fassion_fold/model/entitties/all_products.dart';
import 'package:fassion_fold/model/entitties/banner.dart';
import 'package:fassion_fold/model/entitties/relavent_products.dart';
import 'package:fassion_fold/model/serveices/all_products.dart';
import 'package:fassion_fold/model/serveices/banner.dart';
import 'package:fassion_fold/model/serveices/relavant_products.dart';
import 'package:fassion_fold/view/components/all_products.dart';
import 'package:fassion_fold/view/components/sellers.dart';
import 'package:fassion_fold/view/components/banner.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BestSeller bestSeller = BestSeller();
  AllProducts allProducts = AllProducts();
  late Future<List<AllProductsModel>> allCategories;
  late Future<BannerModel?> banner;
  late Future<List<BestSellerModel>> _sellerDetails;

  @override
  void initState() {
    _sellerDetails = bestSeller.fetchData();
    banner = BannerService().fetchBanner();
    allCategories = allProducts.fetchAllProdocts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          actions: [
            Icon(IconlyLight.search),
            SizedBox(width: 16),
            Icon(IconlyLight.bag_2),
            SizedBox(width: 16),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  BestSellerWidget(sellerDetails: _sellerDetails),
                  BannerWidget(banner: banner, screenHeight: screenHeight),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Assings.ourProducts,
                        style: TextStyle(
                          fontSize: screenHeight * 0.024,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Assings.exploreAll,
                        style: TextStyle(
                            fontSize: screenHeight * 0.020, color: Colors.teal),
                      ),
                    ],
                  ),
                  AllProdutsWidget(
                      allCategories: allCategories,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
