
import 'package:address_book/screens/user_form.dart';
import 'package:flutter/material.dart';
import 'package:address_book/models/user.dart';

class AddUser extends StatefulWidget {

  const AddUser({super.key, required this.user, required this.title, required this.usersCount});
  final User? user;
  final String title;
  final int? usersCount;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title),
            leading:
              IconButton(
                onPressed: _dismisView,
                icon: const Icon(Icons.close))
        ),
        body: AddUserForm(initialUser: widget.user, usersCount: widget.usersCount),
      ),
    );
  }

  void _dismisView() {
    Navigator.of(context, rootNavigator: true).pop(widget.user);
  }
}