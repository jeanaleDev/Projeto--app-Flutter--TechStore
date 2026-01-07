import 'package:projeto_techstore_app_flutter/models/product_model.dart';
import 'package:projeto_techstore_app_flutter/services/back4app_service.dart';

class ProductRepository {
  final Back4appService service;

  ProductRepository({required this.service});

  Future<List<ProductModel>> getProducts() async {
    final result = await service.fecticioProduct();

    return result
        .map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
  }
}
