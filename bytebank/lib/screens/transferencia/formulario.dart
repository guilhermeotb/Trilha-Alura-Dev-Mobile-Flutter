import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Número da Conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text('Confirmar', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text) ?? 0;
    final double valor = double.tryParse(_controladorCampoValor.text) ?? 0.0;
    if (numeroConta != 0 && valor != 0.0) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
