import 'dart:ffi';
import 'dart:io';

class User {

  String? firstName;
  String? lastName;
  int? age;
  String? address;
  File? imageFile;

  String get fullName {
    return '${firstName ?? ''}  ${lastName ?? ''}';
  }

  User(this.firstName, this.lastName, this.age, this.address, this.imageFile);
}