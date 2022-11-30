import 'dart:ffi';
import 'dart:io';

class User {

  int id;
  String? firstName;
  String? lastName;
  int? age;
  String? address;
  File? imageFile;

  String get fullName {
    return '${firstName ?? ''}  ${lastName ?? ''}';
  }

  User(this.id, this.firstName, this.lastName, this.age, this.address, this.imageFile);
}