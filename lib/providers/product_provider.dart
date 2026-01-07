import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/models/product_model.dart';
import 'package:projeto_techstore_app_flutter/repository/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository repository;
  ProductProvider({required this.repository});

  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];

  bool isLoading = false;
  String? error;
  String? selectedCategory;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      products = await repository.getProducts();
      filteredProducts = products;
      error = null;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  void filterByCategory(String category) {
    selectedCategory = category;
    filteredProducts = products
        .where((product) => product.category == category)
        .toList();
    notifyListeners();
  }

  void clearFilter() {
    selectedCategory = null;
    filteredProducts = products;
    notifyListeners();
  }
}
