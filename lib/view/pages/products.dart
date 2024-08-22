import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
              Icon(IconlyLight.heart),
              SizedBox(width: 16),
              Icon(IconlyLight.bag_2),
              SizedBox(width: 16),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  String text = 'Men\'ns Graphic overised -shir-ellicps';
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            // height: screenHeight * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(CupertinoIcons.heart))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '39.95',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
