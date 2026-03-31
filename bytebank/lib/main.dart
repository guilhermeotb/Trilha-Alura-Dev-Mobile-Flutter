import 'package:flutter/material.dart';

void main() {
  runApp(
    ByteBankApp(),
  );
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
        
      ),
    );
  }
}



class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'Criando Transferência',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[900],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                hintText: '0.00',
                labelText: 'Valor',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          
          ElevatedButton(
            onPressed: () {
            },
            child: Text('Confirmar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[900],
              foregroundColor: Colors.white,
            ),
          ),
        ],
      )
      );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Transferências',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[900],
        ),
      body: Column(
        children: [
          Card(child: ItemTransferencia(Transferencia(100.0, 123456))),
          Card(child: ItemTransferencia(Transferencia(200.0, 654321))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.green[900],
        onPressed: () {},
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
