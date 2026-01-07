import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_techstore_app_flutter/pages/product_cart_page.dart';
import 'package:projeto_techstore_app_flutter/pages/product_list_page.dart';
import 'package:projeto_techstore_app_flutter/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductCartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart, color: AppColors.textColor),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Produtos",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),
        ),
      ),
      body: ProductListPage(),
    );
  }
}
