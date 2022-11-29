import 'package:address_book/models/user.dart';
import 'package:flutter/material.dart';

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();

  bool isEnable = false;

  List<String> items = [];
  String? selectedAgeItem;

  @override
  void initState() {
    for (var i = 15; i <= 90; i++) {
      items.add(i.toString());
    }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
    );
  }

  void _hideView() {
    final user = User(
        firstNameController.text,
        lastNameController.text,
        int.parse(selectedAgeItem!),
        addressController.text);
    Navigator.of(context, rootNavigator: true).pop(user);
  }
}