import 'package:flutter/material.dart';
import 'package:address_book/models/user.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key, required this.user});

  final User user;

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
              Image.asset(
              'images/user.png',
                scale: 3,
            ),
              Text(
                user.fullName,
                style: const TextStyle(fontSize: 40),
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
}
