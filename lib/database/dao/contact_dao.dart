import 'package:bytebankmemory/database/app_database.dart';
import 'package:bytebankmemory/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account_number INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account_number = 'account_number';

  Future<int> save(Contact contact) async
  {
    final Database db = await  createDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account_number] = contact.accountNumber;
    return db.insert(_tableName,contactMap);
  } 

  Future<List<Contact>> findAll() async
  {
    final Database db = await  createDatabase();
    final List<Map<String, dynamic>> result = await  db.query(_tableName);
    final List<Contact> contacts = List();

        for(Map<String, dynamic> row in result )
        {
          final Contact contact = Contact(
            row[_id],
            row[_name],
            row[_account_number],
          );
          contacts.add(contact);
        }
        return contacts; 
  }
}