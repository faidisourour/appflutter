import 'package:flutter/material.dart';

class Auth {
  static Future<bool> login(String email, String password) async {
    // Simulate a network request to authenticate the user
    await Future.delayed(const Duration(seconds: 1));
    return email == 'user@example.com' && password == 'password';
  }

  static Future<bool> signup(String email, String password) async {
    // Simulate a network request to create a new user account
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  static Future<void> logout(BuildContext context) async {
    // Perform any cleanup tasks when the user logs out
    Navigator.pushReplacementNamed(context, '/login');
  }

  static Future<bool> isLoggedIn() async {
    // Check if the user is logged in (e.g., check if a token is present)
    return false;
  }
}
