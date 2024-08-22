class BestSellerModel {
  final String image;
  final String text;

  BestSellerModel({
    required this.image,
    required this.text,
  });

  factory BestSellerModel.formjson(Map<String, dynamic> json) {
    return BestSellerModel(
      image: json['image'] ?? '',
      text: json['category'] ?? '',
    );
  }
}
