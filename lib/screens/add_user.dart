
import 'package:address_book/screens/user_form.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override

  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
            leading:
              IconButton(
                onPressed: _dismisView,
                icon: const Icon(Icons.close))
        ),
        body: AddUserForm(),
      ),
    );
  }

  void _dismisView() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}