import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';
import 'package:smart_home_flutter_ui/screen/login.dart';
import 'package:smart_home_flutter_ui/screen/signup.dart';
import 'package:smart_home_flutter_ui/screen/smart_home_screen.dart';
import 'package:smart_home_flutter_ui/screen/welcome.dart';
import 'package:smart_home_flutter_ui/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.bgColor,
        fontFamily: "Poppins",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(apiService: APIService()),
        '/login': (context) => Login(apiService: APIService()),
        '/signup': (context) => Signup(apiService: APIService()),
        '/home': (context) => const SmartHomeScreen(),
      },
    );
  }
}
