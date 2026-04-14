import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Alex', style: TextStyle(fontSize: 24.0),),
              subtitle: Text('1000', style: TextStyle(fontSize: 16.0),),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}