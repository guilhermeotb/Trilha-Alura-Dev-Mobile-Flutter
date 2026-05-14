import 'package:flutter/material.dart';
import 'package:new_project/screens/ciclo_stateful_parent.dart';
import 'screens/contador.dart';
import 'screens/widgets_conteudo.dart';
import 'screens/widgets_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ListContents(),
    );
  }
}

class ListContents extends StatelessWidget {
  final List<CatalogoItem> secoes = [
    CatalogoItem(
      titulo: 'Widgets de Conteúdo',
      icone: Icons.widgets,
      descricao: 'Explore os widgets de conteúdo do Flutter',
      destino: WidgetsConteudo(),
    ),
    CatalogoItem(
      titulo: 'Widgets de Layout',
      icone: Icons.view_quilt,
      descricao: 'Explore os widgets de layout do Flutter',
      destino: WidgetsLayout(),
    ),
    CatalogoItem(
      titulo: 'Ciclo de Vida Stateful',
      icone: Icons.sync,
      descricao: 'Entendendo o ciclo de vida de um StatefulWidget',
      destino: CicloStatefulParent(),
      ),
      CatalogoItem(
        titulo: 'Contador - setState',
        icone: Icons.refresh,
        descricao: 'Exemplo de contador utilizando setState e gerenciamento de estado',
        destino: const Contador(),
        ),
  ];

  ListContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catálago de Widgets')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        crossAxisSpacing: 16,
        childAspectRatio: 1,
        children: secoes
        .map(
              (item) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => item.destino),
                  );
                },
                child: 
               Card(
                child: Padding(padding:
                 EdgeInsets.all(12),
                 child: Column(
                  children: [
                    Icon(
                      item.icone,
                    size: 48,
                    color : Colors.blue
                    ),
                    Text(item.titulo, textAlign: TextAlign.center, style: TextStyle(fontWeight:FontWeight.bold, fontSize: 16,),),
                    Text(item.descricao, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey),),
                  ],
                 ),
              ),
                ),
              ),
              ).toList(),
            )
            
      );
  }
}

class CatalogoItem {
  final String titulo;
  final IconData icone;
  final String descricao;
  final Widget destino;

  CatalogoItem({
    required this.titulo,
    required this.icone,
    required this.descricao,
    required this.destino,
  });
}
