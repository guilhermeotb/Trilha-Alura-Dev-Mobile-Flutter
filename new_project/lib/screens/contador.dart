import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int contador = 0;

  void incrementaValor() {
    setState(() {
      contador++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador- StatefulWidget'),),
      body: Center(
        child: Column(
          children: [
            Text('Você clicou $contador vezes', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: incrementaValor,
              child: Text('Clique Aqui'),
            ),
          ],
        ),
      )
    );
  }
}