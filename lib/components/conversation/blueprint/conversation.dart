import 'package:chapp/components/blueprint/datetime_stamp.dart';
import 'package:chapp/components/blueprint/subject.dart';
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
