import 'package:cached_network_image/cached_network_image.dart';
import 'package:fassion_fold/model/hive/box.dart';
import 'package:fassion_fold/model/hive/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';

class SavedItems extends StatelessWidget {
  const SavedItems({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: ValueListenableBuilder<Box<ProductsModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<ProductsModel>();

          if (data.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text(
                  'No favorites',
                  style: TextStyle(fontFamily: 'JacquesFracois'),
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.back),
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 4, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved Items',
                        style: TextStyle(fontSize: screenHeight * 0.022),
                      ),
                      Text(
                        '${data.length} items',
                        style: TextStyle(
                            color: Colors.grey, fontSize: screenHeight * 0.022),
                      ),
                    ],
                  ),
                ),
                elevation: 2,
                actions: [
                  Icon(IconlyLight.bag_2),
                  SizedBox(width: 16),
                ],
              ),
              body: GridView.builder(
                itemCount: data.length,
                padding: EdgeInsets.all(4),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  final product = data[index];

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
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          product.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          box.delete(product.key);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  'item removed from saved items'),
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
                                        fontSize: screenHeight * 0.020,
                                        color: Colors.grey),
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
                                            fontSize: screenHeight * 0.022,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '60,00',
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.020,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      final data = ProductsModel(
                                        image: product.image,
                                        title: product.title,
                                        price: product.price,
                                      );
                                      final cart = Boxes.getCart();
                                      cart.add(data);
                                      print(cart);
                                      final productKey = product.key as int;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text(
                                              '${product.title} has been added to your cart!'),
                                          duration: Duration(seconds: 2),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Add the item back to favorites if Undo is pressed
                                              box.put(productKey, product);
                                            },
                                          ),
                                        ),
                                      );
                                      box.delete(product.key);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      minimumSize: Size(double.infinity, 50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          IconlyLight.bag_2,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text('ADD TO BAG',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenHeight * 0.018,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
