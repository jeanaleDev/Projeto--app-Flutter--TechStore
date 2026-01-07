class ProductModel {
  final String id;
  final String name;
  final double price;
  final String category;
  final String description;
  final String imageUrl;
  final bool isActive;
  final int stock;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isActive,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['objectId'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      category: json['category'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isActive: json['isActive'] ?? true,
      stock: json['stock'] ?? 0,
    );
  }
}
