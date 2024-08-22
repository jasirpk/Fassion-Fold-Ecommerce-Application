import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class ProductsModel extends HiveObject {
  @HiveField(0)
  String image;

  @HiveField(1)
  String title;

  @HiveField(2)
  String price;

  ProductsModel({
    required this.image,
    required this.title,
    required this.price,
  });
}
