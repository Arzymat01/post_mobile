class Product {
  final String id;
  final String name;
  final int price;
  final int code;
  final int remains;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.code,
    required this.remains,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      code: json['code'] ?? 0,
      remains: json['remains'] ?? 0,
    );
  }
}
