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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade900,
        ).copyWith(
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



class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'Criando Transferência',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(controlador: _controladorCampoNumeroConta, rotulo: 'Número da Conta', dica: '0000'),
            Editor(controlador: _controladorCampoValor, rotulo: 'Valor', dica: '0.00', icone: Icons.monetization_on),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
               _criaTransferencia(context);
        
              },
              child: Text('Confirmar', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      )
      );
  }

  void _criaTransferencia(BuildContext context) {
     final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text) ?? 0;
    final double valor = double.tryParse(_controladorCampoValor.text) ?? 0.0;
    if (numeroConta != 0 && valor != 0.0) {
    
    final transferenciaCriada = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferenciaCriada);
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

class ListaTransferencia extends StatefulWidget {
  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  List<Transferencia> _transferencias = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Transferências',
          ),
        ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, index) {
          // Substitua por lógica para criar itens de transferência
          return ItemTransferencia(_transferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () async {
          final Transferencia? transferenciaRecebida =
              await Navigator.push<Transferencia>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );

          if (transferenciaRecebida != null) {
            setState(() {
              _transferencias.add(transferenciaRecebida);
            });
          }
        },
        child: Icon(Icons.add),
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
