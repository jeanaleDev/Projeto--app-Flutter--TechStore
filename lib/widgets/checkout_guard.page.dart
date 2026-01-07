import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/pages/account_page.dart';
import 'package:projeto_techstore_app_flutter/pages/checkout_page.dart';
import 'package:projeto_techstore_app_flutter/providers/auth_provider.dart';
import 'package:projeto_techstore_app_flutter/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutGuardPage extends StatelessWidget {
  const CheckoutGuardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final cart = context.watch<CartProvider>();
    if (cart.items.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text(
            "Seu carrinho está vazio!",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }
    if (!auth.isLogged) {
      return AccountPage();
    }
    return const CheckoutPage();
  }
}
