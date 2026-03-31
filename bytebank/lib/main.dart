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

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

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
          Editor(controlador: _controladorCampoNumeroConta, rotulo: 'Número da Conta', dica: '0000'),
          Editor(controlador: _controladorCampoValor, rotulo: 'Valor', dica: '0.00', icone: Icons.monetization_on),
          
          ElevatedButton(
            onPressed: () {
             _criaTransferencia();

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

  void _criaTransferencia() {
     final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text) ?? 0;
    final double valor = double.tryParse(_controladorCampoValor.text) ?? 0.0;
    if (numeroConta != 0 && valor != 0.0) {
    
    final transferenciaCriada = Transferencia(valor, numeroConta);
    }
  }
}


class Editor extends StatelessWidget {
  

  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;


  Editor({this.controlador, this.rotulo, this.dica, this.icone});


  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controlador,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: icone != null ? Icon(icone) : null,
                labelText: rotulo,
                hintText: dica,
              ),
              keyboardType: TextInputType.number,
            ),
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
