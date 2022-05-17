class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final dynamic price;
  final String imageLink;
  final Map<String, dynamic> rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageLink,
    required this.rating,
    required this.price,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageLink: json['image'],
      rating: {},
      price: json['price'],
      category: json['category']);
}

getAllProductListFromAPi(json) {
  return List<ProductModel>.from(json.map((x) => ProductModel.fromJson(x)));
}
