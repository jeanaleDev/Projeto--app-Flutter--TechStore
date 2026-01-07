import 'package:flutter/material.dart';
import 'package:projeto_techstore_app_flutter/providers/auth_provider.dart';
import 'package:projeto_techstore_app_flutter/repository/authentication_repository.dart';
import 'package:projeto_techstore_app_flutter/themes/app_colors.dart';
import 'package:projeto_techstore_app_flutter/utils/logout_helper.dart';
import 'package:projeto_techstore_app_flutter/widgets/checkout_guard.page.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final emailctrl = TextEditingController();
  bool loading = false;
  @override
  void dispose() {
    emailctrl.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final auth = context.read<AuthProvider>();
    final repo = context.read<AuthenticationRepository>();

    final email = emailctrl.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Informe um e-mail válido")));
      return;
    }
    setState(() => loading = true);
    try {
      final exists = await repo.userExist(email);
      if (!exists) {
        await repo.register(email);
      }
      await repo.login(email);
      auth.login(email);
      if (mounted)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => CheckoutGuardPage()),
        );
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao autenticar")));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Minha Conta",
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              globalLogout(context);
            },
            icon: Icon(Icons.logout, size: 24, color: AppColors.textColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "Acesse sua conta ou cadastre-se",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14),
              TextFormField(
                controller: emailctrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textColor2),
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: loading ? null : _handleLogin,

                  child: loading
                      ? CircularProgressIndicator()
                      : Text(
                          "Continuar",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 16),
              Center(child: Text("--ou--", style: TextStyle(fontSize: 18))),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDAD7D7),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset("assets/google.png", height: 24),
                      SizedBox(width: 36),
                      Text(
                        "Continuar com Google",
                        style: TextStyle(
                          color: AppColors.textColor2,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
