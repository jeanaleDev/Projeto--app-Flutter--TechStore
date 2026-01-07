import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_techstore_app_flutter/pages/main_page.dart';
import 'package:projeto_techstore_app_flutter/themes/app_colors.dart';

class AppNamePage extends StatelessWidget {
  const AppNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,

            colors: [Color(0xff5ed7e3), Color(0xff2fa4d6), Color(0xff0b5fa5)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TechStore",
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: AppColors.primaryColor,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black26,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Os melhores Hardwares para seu Pc",
                  style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
                ),
                SizedBox(height: 36),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MainPage()),
                    );
                  },
                  child: Text(
                    "Ver Peças",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
