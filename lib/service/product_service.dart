import 'package:dio/dio.dart';
import 'package:post_mobile/models/product_models.dart';

class ApiService {
  static final Dio _dio = Dio();
  static const String _baseUrl = 'http://192.168.123.108:8080/products';

  static Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {'name': query},
      );

      // Жоопту логго чыгаруу (текшерүү үчүн)
      print("API Response: ${response.data}");

      final List<dynamic> data = response.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      print("API Error: $e");
      throw Exception('Failed to fetch products: $e');
    }
  }
}
