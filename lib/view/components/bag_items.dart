import 'package:fassion_fold/model/hive/model.dart';
import 'package:fassion_fold/view/components/bags.dart';
import 'package:fassion_fold/view/pages/order_confirmation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BagItemsWidget extends StatelessWidget {
  const BagItemsWidget({
    super.key,
    required this.screenHeight,
    required this.data,
    required this.screenWidth,
    required this.box,
  });

  final double screenHeight;
  final List<ProductsModel> data;
  final double screenWidth;
  final Box<ProductsModel> box;

  @override
  Widget build(BuildContext context) {
    double sum = data.fold(0.0, (total, item) {
      String cleanPrice = item.price.replaceAll(RegExp(r'[^0-9.]'), '');
      double parsedPrice = double.tryParse(cleanPrice) ?? 0.0;
      return total + parsedPrice;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
        title: Padding(
          padding: const EdgeInsets.only(left: 4, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Bag',
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
          Icon(CupertinoIcons.heart),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: data.length,
              padding: EdgeInsets.all(4),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.8),
              itemBuilder: (context, index) {
                final product = data[index];

                return BagsWidget(
                    box: box,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    product: product);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text(
                          '€ $sum',
                          style: TextStyle(
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        box.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text('Checkout successful!'),
                          duration: Duration(seconds: 2),
                        ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => OrderConfirmation()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 60),
                      ),
                      child: Text('CHECKOUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.018,
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
