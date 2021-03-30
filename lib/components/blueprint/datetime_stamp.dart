import 'package:chapp/components/blueprint/datetime_stamp_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeStamp {
  DateTimeStampCategory category;
  String time;
  String day;
  String date;

  DateTimeStamp({@required this.category, this.time, this.day, this.date});

  static DateTimeStamp getStampOf(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime localDateTime = dateTime.toLocal();

    // just now
    /* Cancel just now option
    DateTime justNow = DateTime.now().subtract(Duration(minutes: 1));
    if (!localDateTime.difference(justNow).isNegative) {
      return DateTimeStamp(category: DateTimeStampCategory.just_now);
    }
    */

    String roughTimeString = DateFormat.Hm().format(dateTime);

    // today
    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return DateTimeStamp(
          category: DateTimeStampCategory.today, time: roughTimeString);
    }

    // yesterday
    DateTime yesterday = now.subtract(Duration(days: 1));
    if (localDateTime.day == yesterday.day &&
        localDateTime.month == yesterday.month &&
        localDateTime.year == yesterday.year) {
      return DateTimeStamp(
          category: DateTimeStampCategory.yesterday, time: roughTimeString);
    }

    // last couple of days
    int difference = now.difference(localDateTime).inDays;
    String dayIde = DateFormat('EEEE').format(localDateTime);
    switch (difference) {
      case 1:
        return DateTimeStamp(
            category: DateTimeStampCategory.two_days_before,
            time: roughTimeString,
            day: dayIde);
      case 2:
        return DateTimeStamp(
            category: DateTimeStampCategory.three_days_before,
            time: roughTimeString,
            day: dayIde);
      case 3:
        return DateTimeStamp(
            category: DateTimeStampCategory.four_days_before,
            time: roughTimeString,
            day: dayIde);
      case 4:
        return DateTimeStamp(
            category: DateTimeStampCategory.four_days_before,
            time: roughTimeString,
            day: dayIde);
      default:
        return DateTimeStamp(
            category: DateTimeStampCategory.long_time_ago,
            time: roughTimeString,
            date: DateFormat('dd/MM/yyyy').format(localDateTime));
    }
  }

  static String getTimeStampIdeOf(DateTimeStamp timeStamp) {
    switch (timeStamp.category) {
      case DateTimeStampCategory.just_now:
      case DateTimeStampCategory.today:
      case DateTimeStampCategory.yesterday:
        {
          return timeStamp.category.ide;
        }
      case DateTimeStampCategory.two_days_before:
      case DateTimeStampCategory.three_days_before:
      case DateTimeStampCategory.four_days_before:
      case DateTimeStampCategory.five_days_before:
        {
          return timeStamp.day;
        }
      default:
        {
          return timeStamp.date;
        }
    }
  }
}
