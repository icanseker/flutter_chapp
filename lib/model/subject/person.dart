import 'package:chapp/model/subject/person_status.dart';
import 'package:chapp/model/subject/subject.dart';
import 'package:flutter/material.dart';

class Person extends Subject {
  String name;
  String surname;

  String phoneNumber;

  PersonStatus status;
  DateTime lastSeen;

  Person({
    @required String id,
    this.name,
    this.surname,
    this.phoneNumber,
    String avatarUrl,
    this.status,
    this.lastSeen,
  }) : super(id: id, avatarUrl: avatarUrl);

  @override
  String get title {
    if (this.name == null) {
      if (this.phoneNumber != null)
        return this.phoneNumber + ' @' + this.id;
      else
        return '@' + this.id;
    }
    return this.surname != null ? this.name + ' ' + this.surname : this.name;
  }
}
