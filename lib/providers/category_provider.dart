import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/repository/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepository repository;

  CategoryProvider({required this.repository}) {
    loadCategories();
  }

  List<String> categories = [];
  bool isLoading = false;

  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      categories = await repository.fetchCategories();
    } catch (e) {
      categories = [];
    }
    isLoading = false;
    notifyListeners();
  }
}
