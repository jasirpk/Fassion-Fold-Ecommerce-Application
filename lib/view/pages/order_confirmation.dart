import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back),
          ),
          title: Text("Order Confirmation"),
        ),
        body: Center(
          child: Image.asset(
            'assets/images/Group 577.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
