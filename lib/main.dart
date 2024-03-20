import 'package:flutter/material.dart';
import 'package:green_io/src/pages/auth/login_page.dart';
import 'package:green_io/src/config/app_colors.dart';

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
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          backgroundColor: AppColors.appSwatchColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 51, 158, 54)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
