import 'package:cached_network_image/cached_network_image.dart';
import 'package:fassion_fold/model/entitties/all_products.dart';
import 'package:fassion_fold/model/hive/box.dart';
import 'package:fassion_fold/model/hive/model.dart';
import 'package:fassion_fold/model/serveices/all_products.dart';
import 'package:fassion_fold/view/components/shimmer/all_products.dart';
import 'package:fassion_fold/view_model/favorite_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  AllProducts allProducts = AllProducts();
  late Future<List<AllProductsModel>> allCategories;
  late Box<ProductsModel> productBox;

  @override
  void initState() {
    super.initState();
    allCategories = allProducts.fetchAllProdocts();
    productBox = Boxes.getData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: FutureBuilder(
        future: allCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AllProductsShimmer(
                screenHeight: screenHeight, screenWidth: screenWidth);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {}, icon: Icon(CupertinoIcons.back)),
                title: Padding(
                  padding: const EdgeInsets.only(left: 4, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved Items',
                        style: TextStyle(fontSize: screenHeight * 0.022),
                      ),
                      Text(
                        "${categories.length.toString()} items",
                        style: TextStyle(
                            color: Colors.grey, fontSize: screenHeight * 0.022),
                      ),
                    ],
                  ),
                ),
                elevation: 2,
                actions: [
                  Icon(IconlyLight.heart),
                  SizedBox(width: 16),
                  Icon(IconlyLight.bag_2),
                  SizedBox(width: 16),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.6),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final favoriteProvider =
                          Provider.of<FavoriteProvider>(context);
                      bool isFavorite = favoriteProvider.isFavorite(index);

                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: category.image,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(),
                                      IconButton(
                                        onPressed: () {
                                          final favoriteProvider =
                                              Provider.of<FavoriteProvider>(
                                                  context,
                                                  listen: false);
                                          favoriteProvider
                                              .toggleFavorite(index);
                                          bool isFavorite = favoriteProvider
                                              .isFavorite(index);

                                          var data = ProductsModel(
                                            image: category.image,
                                            title: category.title,
                                            price: category.price.toString(),
                                          );

                                          if (isFavorite) {
                                            // If the item is not in favorites, add it
                                            productBox.add(data);
                                            print(
                                                'Item added to favorites: $data');
                                          } else {}
                                        },
                                        icon: isFavorite
                                            ? Icon(CupertinoIcons.heart_fill,
                                                color: Colors.teal)
                                            : Icon(CupertinoIcons.heart),
                                      ),
                                    ],
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
                              ),
                            )),
                            SizedBox(height: 8),
                            Text(
                              category.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "€ ${category.price.toString()}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            );
          } else {
            return Text('NO Data Available');
          }
        },
      ),
    );
  }
}
