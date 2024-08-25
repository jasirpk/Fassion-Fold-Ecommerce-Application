import 'package:fassion_fold/model/hive/box.dart';
import 'package:fassion_fold/model/hive/model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';

class BagButtonWidget extends StatelessWidget {
  const BagButtonWidget({
    super.key,
    required this.product,
    required this.box,
    required this.screenHeight,
  });

  final ProductsModel product;
  final Box<ProductsModel> box;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Text('${product.title} has been added to your cart!'),
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
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
