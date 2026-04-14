import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
void main()  => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700]),
      ),
      home: Dashboard(),
    );
  }
}

