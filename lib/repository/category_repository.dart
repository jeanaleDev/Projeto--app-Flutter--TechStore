import 'package:projeto_techstore_app_flutter/services/back4app_service.dart';

class CategoryRepository {
  final Back4appService service;
  CategoryRepository({required this.service});

  Future<List<String>> fetchCategories() async {
    final products = await service.fecticioProduct();
    final categories = products
        .where((product) => product['category'] != null)
        .map((product) => product['category'] as String)
        .toSet()
        .toList();
    return categories;
  }
}
