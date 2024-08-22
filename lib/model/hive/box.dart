import 'package:fassion_fold/model/hive/model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<ProductsModel> getData() => Hive.box<ProductsModel>('products');
  static Box<ProductsModel> getCart() => Hive.box<ProductsModel>('carts');
}
