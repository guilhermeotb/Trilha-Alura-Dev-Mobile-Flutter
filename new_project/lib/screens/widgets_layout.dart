import 'package:flutter/material.dart';
import 'package:new_project/widgets/titulo_secao.dart';

class WidgetsLayout extends StatelessWidget {
  const WidgetsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets de Layout'),),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TituloSecao(titulo: 'Padding'),
          Container(
            color: Colors.amberAccent,
            child: Padding(padding: EdgeInsets.all(20),
            child: Text('Texto com padding de 20px'),
            ),
          ),
          Divider(),

          TituloSecao(titulo: 'Alignment'),
          Container(height:80,
          color: Colors.amberAccent,
          child: Align(alignment: Alignment.topLeft,
          child: Text('Alinhamento de Texto'),
          ),
          ),

          Divider(),

          TituloSecao(titulo: 'Center'),
          Container(
          height:80,
          color: Colors.amberAccent,
          child: Center(
        child: Text('Alinhamento de Texto'),
          ),
          ),

          Divider(),

          TituloSecao(titulo: 'SizedBox'),
          Column(children: [
            Text('Texto Acima'),
            SizedBox(height: 20,),
            Text('Texto Abaixo'),
          ],
          ),

          Divider(),

          TituloSecao(titulo: 'Expanded e Flexible'),
          Container(
            height: 200,
            color: Colors.amberAccent,
            child: Column(
              children: [
                Expanded(child: Container(
                  color: Colors.red,
                  child: Center(child: Text('Expanded')),
                )),
                Flexible(
                  flex: 3,
                  child: Container(
                  color: Colors.green,
                  child: Center(child: Text('Flexible 3')),
                ))
              ],
            ),
            ),
          
          TituloSecao(titulo: 'Expandeded e Flexible (Row)'),
          Row(children:[
            Expanded(child: Container(
              height: 50,
              color: Colors.red,
              child: Center(child: Text('Expanded')),
            ),
            ),
            Flexible(
              flex: 2,
              child: 
            Container(
              height: 50,
              color: Colors.green,
              child: Center(child: Text('Flexible 2')),
            ),)
          ],
          ),


        ],
      ),
    );
  }
}