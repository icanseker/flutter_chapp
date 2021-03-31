enum DateTimeStampCategory {
  just_now,
  today,
  yesterday,
  two_days_before,
  three_days_before,
  four_days_before,
  five_days_before,
  long_time_ago
}

extension DateTimeStampCategoryIde on DateTimeStampCategory {
  String get ide {
    switch (this) {
      case DateTimeStampCategory.just_now:
        return 'Just Now';
      case DateTimeStampCategory.today:
        return 'Today';
      case DateTimeStampCategory.yesterday:
        return 'Yesterday';
      case DateTimeStampCategory.two_days_before:
        return 'Two Days Before';
      case DateTimeStampCategory.three_days_before:
        return 'Three Days Before';
      case DateTimeStampCategory.four_days_before:
        return 'Four Days Before';
      case DateTimeStampCategory.five_days_before:
        return 'Five Days Before';
      case DateTimeStampCategory.long_time_ago:
        return 'Long Time Ago';
    }
    return '';
  }
}
