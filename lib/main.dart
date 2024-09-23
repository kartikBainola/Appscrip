import 'package:appscrip/Screens/Homepage.dart';
import 'package:appscrip/style/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appscrip',
      theme: MyAppTheme.lightMode,
      darkTheme: MyAppTheme.darkMode,
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
