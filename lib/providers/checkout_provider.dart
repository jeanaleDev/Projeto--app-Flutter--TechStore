import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/providers/cart_provider.dart';

class CheckoutProvider extends ChangeNotifier {
  final CartProvider cartProvider;
  CheckoutProvider({required this.cartProvider});

  bool isProcessing = false;
  String? error;

  double get total => cartProvider.totalPrice;
  int get totalItems => cartProvider.totalItems;

  Future<bool> confirmCheckout() async {
    isProcessing = true;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 2));
      cartProvider.clear();
      return true;
    } catch (e) {
      error = "Erro ao finalizar pedido";
      return false;
    } finally {
      isProcessing = false;
      notifyListeners();
    }
  }
}
