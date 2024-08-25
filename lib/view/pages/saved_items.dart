import 'package:fassion_fold/model/hive/box.dart';
import 'package:fassion_fold/model/hive/model.dart';
import 'package:fassion_fold/view/components/saved_items.dart';
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

                  return SavedItemsWidget(
                      box: box,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      product: product);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
