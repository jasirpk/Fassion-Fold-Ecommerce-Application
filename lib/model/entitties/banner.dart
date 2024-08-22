class BannerModel {
  final String image;
  final String description;

  BannerModel({required this.description, required this.image});
  factory BannerModel.formjson(Map<String, dynamic> json) {
    return BannerModel(
      description: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
