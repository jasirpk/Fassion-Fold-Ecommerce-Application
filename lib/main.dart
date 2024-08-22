import 'package:fassion_fold/model/hive/model.dart';
import 'package:fassion_fold/view/pages/bottom_navigation.dart';
import 'package:fassion_fold/view_model/bottom_navbar.dart';
import 'package:fassion_fold/view_model/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ProductsModelAdapter());

  await Hive.openBox<ProductsModel>('products');
  await Hive.openBox<ProductsModel>('carts');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BottomNavBarState()),
    ChangeNotifierProvider(create: (_) => FavoriteProvider())
  ], child: FasionFold()));
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
