import 'package:flutter/material.dart';

abstract class Subject {
  final String id;
  final String avatarUrl;

  Subject({@required this.id, @required this.avatarUrl});

  String get title;
}
