import 'package:flutter/material.dart';
import 'screens/contacts_list.dart';
import 'screens/dashboard.dart';
import 'screens/contact_form.dart';
import 'package:bytebankmemory/models/contact.dart';
import 'package:bytebankmemory/database/app_database.dart';

void main() => runApp(BytebanckApp());

class BytebanckApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
      ),
      home: Dashboard(),
    );
  }
}

