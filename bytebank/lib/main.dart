import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900)
            .copyWith(
              primary: Colors.green.shade900,
              secondary: Colors.blueAccent.shade700,
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade900,
          foregroundColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent.shade700,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTransferencia(),
    );
  }
}
