import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/themes/app_colors.dart';

class OrderSucessPage extends StatefulWidget {
  const OrderSucessPage({super.key});

  @override
  State<OrderSucessPage> createState() => _OrderSucessPageState();
}

class _OrderSucessPageState extends State<OrderSucessPage> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: animate ? 1 : 0.5,
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, size: 64, color: Colors.white),
              ),
            ),
            SizedBox(height: 24),
            AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: Duration(milliseconds: 600),
              child: Text(
                "Pedido realizado com Sucesso!!!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),
            AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: Duration(milliseconds: 800),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text(
                  "Voltar ao início",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
