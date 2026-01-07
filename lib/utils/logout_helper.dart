import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/pages/main_page.dart';
import 'package:projeto_techstore_app_flutter/providers/auth_provider.dart';
import 'package:projeto_techstore_app_flutter/providers/cart_provider.dart';
import 'package:provider/provider.dart';

Future<void> globalLogout(BuildContext context) async {
  final auth = context.read<AuthProvider>();
  final cart = context.read<CartProvider>();

  await auth.logout();
  cart.clear();

  if (context.mounted) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => MainPage()),
      (route) => false,
    );
  }
}
