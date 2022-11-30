import 'package:address_book/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key, required this.initialUser, required this.usersCount});

  final User? initialUser;
  final int? usersCount;

  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();

  bool isEnable = false;
  File? _imageFile;

  List<String> items = [];
  String? selectedAgeItem;

  @override
  void initState() {
    for (var i = 15; i <= 90; i++) {
      items.add(i.toString());
    }

    final firstName = (widget.initialUser?.firstName ?? '');
    final lastName = (widget.initialUser?.lastName ?? '');
    final address = (widget.initialUser?.address ?? '');

    firstNameController.text = firstName;
    lastNameController.text = lastName;
    addressController.text = address;

    if (widget.initialUser?.imageFile != null) {
      _imageFile = widget.initialUser!.imageFile!;
    }

    if (widget.initialUser?.age != null) {
      selectedAgeItem = widget.initialUser!.age!.toString();
    }

    validateButton();
    super.initState();
  }

  void validateButton() {
    isEnable = firstNameController.text != '' &&
        lastNameController.text != '' &&
        addressController.text != '' &&
        (selectedAgeItem ?? '') != '';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16,),
            Center(
              child: InkWell(
                child: _imageFile == null ?
                Image.asset('images/user.png', width: 200.0,height: 200.0,):
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(100.0), // Image radius
                    child: Image.file(_imageFile!, width: 200.0, height: 200.0, fit: BoxFit.cover,),
                  ),
                ),
                onTap: () {
                  pickImage();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (_) {
                  setState(() {
                    validateButton();
                  });
                },
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'First name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: TextField(
                onChanged: (_) {
                  setState(() {
                    validateButton();
                  });
                },
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Last name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: TextField(
                onChanged: (_) {
                  setState(() {
                    validateButton();
                  });
                },
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: SizedBox(
                  width: 600,
                  height: 60,
                  child: DropdownButtonFormField<String>(
                    value: selectedAgeItem,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular (6),
                          borderSide: const BorderSide (width: 1, color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular (6),
                          borderSide: const BorderSide (width: 1, color: Colors.grey),
                        )
                    ),
                    // value: selectedItem,
                    hint: const Text("Select age"),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: const TextStyle(fontSize: 19, color: Colors.blueGrey)),
                    ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      selectedAgeItem = item;
                      validateButton();
                    }),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(60), // NEW
                ),
                onPressed: isEnable ? () {
                  _hideView();
                } : null,
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
          ],
        ),
      );
  }

  void _hideView() {
    final user = User( widget.initialUser == null
            ? (widget.usersCount ?? 0) + 1
            : widget.initialUser!.id,
        firstNameController.text,
        lastNameController.text,
        int.parse(selectedAgeItem!),
        addressController.text,
        _imageFile);
    Navigator.of(context, rootNavigator: true).pop(user);
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