import 'package:flutter/material.dart';
import 'package:bytebankmemory/screens/contacts_list.dart';
import 'package:bytebankmemory/models/contact.dart';
import 'package:bytebankmemory/database/app_database.dart';
import 'package:bytebankmemory/database/dao/contact_dao.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child:
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full name',
                ),
                style: TextStyle(
                    fontSize: 24.0
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child:
              TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(
                    fontSize: 24.0
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child:RaisedButton(
                  child: Text("Create"),
                  onPressed: (){
                    final String name = _nameController.text;
                    final int accountNumber = int.tryParse(_accountNumberController.text);

                    final Contact newContact = Contact(0,name,accountNumber);
                    _dao.save(newContact).then((id) =>Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
