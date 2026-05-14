import 'package:flutter/material.dart';

import '../widgets/titulo_secao.dart';

class WidgetsConteudo extends StatelessWidget {
  const WidgetsConteudo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Widgets de Conteudo')),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TituloSecao(titulo: 'Textos'),
        Text('Texto estilizado', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            ),
        ),
        Text('Texto com estilo padrão', style: TextStyle(
            fontSize: 18,
            ),
        ),

        Divider(),
        TituloSecao(titulo: 'Imagem'),
      
  
        Image.network(
        'https://picsum.photos/id/237/200/300',
        height: 240,
        ),

        Divider(),
        TituloSecao(titulo: 'Icone'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.favorite, color: Colors.red, size:32,),
            Icon(Icons.star, color: Colors.amber, size:32,),
            Icon(Icons.settings, color: Colors.blue, size:32,),
          ],
        ),

        Divider(),

        TituloSecao(titulo: 'ElevatedButton'),
        ElevatedButton(onPressed: (){}, child: Text('Clique aqui')),
        
        ],
        ),
      );
  }
}