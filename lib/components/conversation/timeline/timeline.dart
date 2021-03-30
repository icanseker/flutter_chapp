import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/conversation/timeline/multi_channel_timeline.dart';
import 'package:chapp/components/conversation/timeline/single_channel_timeline.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:flutter/material.dart';

class ConversationTimeline extends StatelessWidget {
  final Conversation conversation;

  const ConversationTimeline({this.conversation});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    return Expanded(
      child: SingleChildScrollView(
        padding: MediaQuery.of(context).viewPadding,
        controller: _scrollController,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(12.0),
          child: conversation is SingleChannelConversation
              ? SingleChannelTimeline(conversation: conversation)
              : MultiChannelTimeline(conversation: conversation),
        ),
      ),
    );
  }

  static getTimelineDivider(String label) {
    return HorizontalDivider(
      labelAlignment: Alignment.center,
      label: label,
      labelMarginAmount: 12.0,
      labelTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
      lineColor: Colors.grey[200],
      dividerMarginInsets: EdgeInsets.only(top: 16, bottom: 2),
    );
  }
}
