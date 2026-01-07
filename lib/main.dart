import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/pages/app_name_page.dart';
import 'package:projeto_techstore_app_flutter/providers/auth_provider.dart';
import 'package:projeto_techstore_app_flutter/providers/cart_provider.dart';
import 'package:projeto_techstore_app_flutter/providers/category_provider.dart';
import 'package:projeto_techstore_app_flutter/providers/checkout_provider.dart';
import 'package:projeto_techstore_app_flutter/providers/product_provider.dart';
import 'package:projeto_techstore_app_flutter/repository/authentication_repository.dart';
import 'package:projeto_techstore_app_flutter/repository/category_repository.dart';
import 'package:projeto_techstore_app_flutter/repository/product_repository.dart';
import 'package:projeto_techstore_app_flutter/services/back4app_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authProvider = AuthProvider();
  await authProvider.restoreLogin();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),

        ChangeNotifierProvider(
          create: (_) => ProductProvider(
            repository: ProductRepository(service: Back4appService()),
          ),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(
            repository: CategoryRepository(service: Back4appService()),
          ),
        ),
        ChangeNotifierProxyProvider<CartProvider, CheckoutProvider>(
          create: (context) =>
              CheckoutProvider(cartProvider: context.read<CartProvider>()),
          update: (context, cart, checkout) =>
              CheckoutProvider(cartProvider: cart),
        ),
        Provider(create: (_) => AuthenticationRepository()),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AppNamePage(),
    );
  }
}
