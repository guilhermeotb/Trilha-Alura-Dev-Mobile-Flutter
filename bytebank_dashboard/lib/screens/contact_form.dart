import 'package:bytebank_dashboard/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberControllerr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  hintText: 'Enter your full name',
                ),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _accountNumberControllerr,
                decoration: InputDecoration(
                  labelText: 'Account number',
                  hintText: 'Enter account number',
                ),
                style: TextStyle(fontSize: 16.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? accountNumber = int.tryParse(_accountNumberControllerr.text);
                    final Contact newContact = Contact(name, accountNumber!);
                    Navigator.pop(context, newContact);
                  },
                  child: Text('Create'),
                ),
              ),
            )
          ],
          
        ),
      ),
    );
  }
}