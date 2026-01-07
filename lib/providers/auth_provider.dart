import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _email;
  // bool _isAuthenticated = false;
  bool _isLogged = false;

  // bool get isAuthenticated => _isAuthenticated;
  bool get isLogged => _isLogged;
  String? get email => _email;

  Future<void> restoreLogin() async {
    final prefs = await SharedPreferences.getInstance();
    _email = prefs.getString("user_email");
    _isLogged = _email != null;
    notifyListeners();
  }

  Future<void> login(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_email", email);
    _email = email;
    _isLogged = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user_email");
    _email = null;
    _isLogged = false;
    notifyListeners();
  }
}
