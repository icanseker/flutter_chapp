import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

enum MessageStatus {
  received,
  sent,
  delivered,
  read,
  send_error,
  waiting_for_connection
}

extension MessageStatusIde on MessageStatus {
  IconData get icon {
    switch (this) {
      case MessageStatus.send_error:
        return Ionicons.warning_outline;
      case MessageStatus.received:
        return Ionicons.arrow_down_outline;
      case MessageStatus.sent:
        return Ionicons.arrow_up_outline;
      case MessageStatus.delivered:
        return Ionicons.checkmark_sharp;
      case MessageStatus.read:
        return Ionicons.checkmark_done_sharp;
      case MessageStatus.waiting_for_connection:
        return Ionicons.timer_outline;
    }
    return null;
  }

  Color get iconColor {
    switch (this) {
      case MessageStatus.send_error:
        return Colors.red;
      case MessageStatus.received:
        return Colors.black;
      case MessageStatus.sent:
        return Colors.blueAccent;
      case MessageStatus.delivered:
        return Colors.black45;
      case MessageStatus.read:
        return Colors.lightGreen;
      case MessageStatus.waiting_for_connection:
        return Colors.red[900];
    }
    return null;
  }
}
