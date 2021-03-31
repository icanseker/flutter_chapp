import 'package:chapp/model/datetime/datetime_stamp.dart';
import 'package:chapp/model/subject/subject.dart';
import 'package:flutter/material.dart';

abstract class Conversation {
  final String id;

  Conversation({@required this.id});

  int unReadCount = 0;

  Subject get subject;

  Image get avatar;

  DateTimeStamp get lastActivityTimeStamp;

  String get title;
}
