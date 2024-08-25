import 'package:fassion_fold/model/hive/box.dart';
import 'package:fassion_fold/model/hive/model.dart';
import 'package:fassion_fold/view/components/bag_items.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyBag extends StatelessWidget {
  const MyBag({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ValueListenableBuilder<Box<ProductsModel>>(
        valueListenable: Boxes.getCart().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<ProductsModel>();
          if (data.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text(
                  'No carts',
                  style: TextStyle(fontFamily: 'JacquesFracois'),
                ),
              ),
            );
          } else {
            return BagItemsWidget(box: box,
                screenHeight: screenHeight,
                data: data,
                screenWidth: screenWidth);
          }
        },
      ),
    );
  }
}
