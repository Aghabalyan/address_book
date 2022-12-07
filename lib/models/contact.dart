import 'dart:ffi';
import 'dart:io';

class Contact {

  int id;
  String? userName;
  int? elapsedTimeInHour;
  bool? bookmarked;
  String? userImage;
  String? title;
  String? description;
  List<String> images;

  Contact(this.id, this.userName, this.elapsedTimeInHour, this.bookmarked,
      this.userImage, this.title, this.description, this.images);
}