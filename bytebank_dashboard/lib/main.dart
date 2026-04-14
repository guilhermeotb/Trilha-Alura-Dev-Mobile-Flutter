import 'package:flutter/material.dart';
void main()  => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700]),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[900],
          foregroundColor: Colors.white,
        ),
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.people, color: Colors.white,size:32),
                  Text('Clientes', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                ],
              ),
            ),
          )
        ]
      ),
      );
  }
}