import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:smart_home_flutter_ui/constants/app_colors.dart';
import 'package:smart_home_flutter_ui/screen/login.dart';
import 'package:smart_home_flutter_ui/screen/signup.dart';
import 'package:smart_home_flutter_ui/screen/smart_home_screen.dart';
import 'package:smart_home_flutter_ui/screen/welcome.dart';
import 'package:smart_home_flutter_ui/services/api_service.dart';

void main() {
  final apiService = ApiService('http://192.168.1.18:8080');
  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({Key? key, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => Login(apiService: apiService),
        '/signup': (context) => Signup(apiService: apiService),
        '/home': (context) => const SmartHomeScreen(),
      },
    );
  }
}
