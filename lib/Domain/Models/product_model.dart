class ProductModel {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String description;
  final double price;
  int cardCount;

  ProductModel({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.price,
    required this.cardCount,
  });
}
