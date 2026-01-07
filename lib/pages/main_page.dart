import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/pages/account_page.dart';
import 'package:projeto_techstore_app_flutter/pages/home_page.dart';
import 'package:projeto_techstore_app_flutter/themes/app_colors.dart';
import 'package:projeto_techstore_app_flutter/widgets/category_drawer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final pages = [HomePage(), SizedBox(), AccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CategoryDrawerWidget(),
      body: IndexedStack(
        index: _currentIndex == 1 ? 0 : _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            _scaffoldKey.currentState?.openDrawer();
            return;
          }
          setState(() => _currentIndex = index);
        },

        selectedItemColor: AppColors.textColor,
        unselectedItemColor: Colors.black,
        backgroundColor: AppColors.primaryColor,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Minha conta',
          ),
        ],
      ),
    );
  }
}
