import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:address_book/models/user.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'add_user.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key, required this.initialUser});

  final User initialUser;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {

  late User user = widget.initialUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: InkResponse(
              onTap: () => Navigator.of(context, rootNavigator: true).pop(user),
              child: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('Detail page'),
          actions: [
            IconButton(
                onPressed: () {
                  _showEditUser();
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Column(children: [
              const SizedBox(height: 8),
            InkWell(
              child: user.imageFile == null ?
              Image.asset(
                'images/user.png',
                width: 200.0,
                height: 200.0,):
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(100.0), // Image radius
                    child: Image.file(
                      user.imageFile!,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,),
                  ),
                ),
              onTap: () { },
            ),
              Text(
                user.fullName,
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                user.address ?? '- -',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                '${user.age.toString()} years old',
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {

      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _showEditUser() async {
    final result = await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => AddUser(user: user, title: 'Edit User', usersCount: null),
      ),
    );
    if (result != null && result is User) {
      setState(() {
          user = result;
      });
    }
  }
}