import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/homelanding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Wings',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeLandingPage (),
    );
  }
}
