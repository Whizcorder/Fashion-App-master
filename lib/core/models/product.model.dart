class Product {
  final String imageUrl;
  final String productName;
  final double price;
  final int position;

  Product({
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.position,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      imageUrl: json['imageUrl'] ?? '',
      productName: json['productName'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      position: json['position'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'productName': productName,
      'price': price,
      'position': position,
    };
  }
}