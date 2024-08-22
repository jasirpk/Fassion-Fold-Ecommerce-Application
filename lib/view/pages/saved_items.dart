import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SavedItems extends StatelessWidget {
  const SavedItems({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
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
                  '2 items',
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
          itemCount: 4,
          padding: EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.6),
          itemBuilder: (context, index) {
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
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Men\'s Black the ryuk graphic printed oversized T-shirt',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.delete,
                                      size: 30,
                                    )),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '60,00',
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
                            SizedBox(width: 10),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
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
      ),
    );
  }
}
