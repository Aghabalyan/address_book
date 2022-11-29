import 'dart:ffi';
class User {

  String? firstName;
  String? lastName;
  int? age;
  String? address;

  String get fullName {
    return '${firstName ?? ''}  ${lastName ?? ''}';
  }

  User(this.firstName, this.lastName, this.age, this.address);
}