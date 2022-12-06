import 'package:address_book/screens/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:address_book/screens/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //const Users(title: 'Address Book'),
          const HomeTabBar(),
    );
  }
}