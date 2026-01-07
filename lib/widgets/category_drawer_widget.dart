import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/providers/category_provider.dart';
import 'package:projeto_techstore_app_flutter/providers/product_provider.dart';
import 'package:projeto_techstore_app_flutter/themes/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDrawerWidget extends StatelessWidget {
  const CategoryDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    return Drawer(
      backgroundColor: AppColors.textColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Categorias",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                "Todas as categorias",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.clear),
              onTap: () {
                context.read<ProductProvider>().clearFilter();
                Navigator.pop(context);
              },
            ),
            Divider(),
            if (categoryProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (categoryProvider.categories.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                    final category = categoryProvider.categories[index];
                    return ListTile(
                      title: Text(category),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        context.read<ProductProvider>().filterByCategory(
                          category,
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
