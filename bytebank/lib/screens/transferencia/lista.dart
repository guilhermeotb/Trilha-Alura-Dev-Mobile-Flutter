import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

import '../../models/transferencia.dart';

class ListaTransferencia extends StatefulWidget {
  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  List<Transferencia> _transferencias = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências')),
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
