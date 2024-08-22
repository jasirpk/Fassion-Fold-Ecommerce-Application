import 'package:fassion_fold/model/hive/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  // Future<void> addData(ProductsModel products) async {
  //   var box = await Hive.openBox('products');
  //   await box.add(products);
  // }

  Future<List<ProductsModel>> getData() async {
    var box = await Hive.openBox<ProductsModel>('products');
    return box.values.toList();
  }

  void deleteData(int index) async {
    var box = await Hive.openBox<ProductsModel>('products');
    return box.deleteAt(index);
  }
}
