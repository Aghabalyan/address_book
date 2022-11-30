import 'dart:io';

import 'package:flutter/material.dart';
import 'package:address_book/models/user.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key, required this.user});

  final User user;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {

  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: InkResponse(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('Detail page'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Column(children: [
              const SizedBox(height: 8),
            InkWell(
              child: widget.user.imageFile == null ?
              Image.asset('images/user.png', width: 200.0,height: 200.0,):
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(100.0), // Image radius
                    child: Image.file(widget.user.imageFile!, width: 200.0, height: 200.0, fit: BoxFit.cover,),
                  ),
                ),
              onTap: () {
                pickImage();
              },
            ),
              Text(
                widget.user.fullName,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 8),
              Text(
                widget.user.address ?? '- -',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.user.age.toString()} years old',
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
        _imageFile = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
