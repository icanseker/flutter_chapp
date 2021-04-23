import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/conversation/timeline/multi_channel_timeline.dart';
import 'package:chapp/components/conversation/timeline/settings.dart';
import 'package:chapp/components/conversation/timeline/single_channel_timeline.dart';
import 'package:chapp/components/divider/horizontal_divider.dart';
import 'package:chapp/components/swipeable/blueprint/simultaneity_definition.dart';
import 'package:flutter/material.dart';

class ConversationTimeline extends StatelessWidget {
  final Conversation conversation;
  static final SwipeSimultaneityController swipeSimultaneityController =
      SwipeSimultaneityController(maxSimultaneouslySwipedObj: 1);

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
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: conversation is SingleChannelConversation
              ? SingleChannelTimeline(conversation: conversation)
              : MultiChannelTimeline(conversation: conversation),
        ),
      ),
    );
  }

  static timelineDivider(String label) {
    return HorizontalDivider(
      labelAlignment: Alignment.center,
      label: Text(
        label,
        style: TextStyle(
          fontSize: ConversationTimelineSettings.timelineDividerLabelFontSize,
          color: ConversationTimelineSettings.timelineDividerLineColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      labelMarginInsets: EdgeInsets.symmetric(horizontal: 12.0),
      color: Colors.grey[200],
      marginInsets: EdgeInsets.only(top: 16, bottom: 2),
    );
  }
}
