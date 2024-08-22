class AllProductsModel {
  final String image;
  final String title;
  final double price;

  AllProductsModel({
    required this.image,
    required this.title,
    required this.price,
  });
  factory AllProductsModel.formjson(Map<String, dynamic> json) {
    return AllProductsModel(
      image: json['image'] ?? "",
      title: json['title'] ?? "",
      price: json['price'].toDouble() ?? '',
    );
  }
}
