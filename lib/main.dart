import 'package:fassion_fold/view/pages/bottom_navigation.dart';
import 'package:fassion_fold/view_model/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BottomNavBarState())],
      child: FasionFold()));
}

class FasionFold extends StatelessWidget {
  const FasionFold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
              bodySmall: TextStyle(color: Colors.black))),
      home: BottomNavigation(),
    );
  }
}
