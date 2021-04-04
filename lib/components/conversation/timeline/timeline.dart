import 'package:chapp/components/conversation/blueprint/conversation.dart';
import 'package:chapp/components/conversation/blueprint/single_channel_conversation.dart';
import 'package:chapp/components/conversation/timeline/multi_channel_timeline.dart';
import 'package:chapp/components/conversation/timeline/single_channel_timeline.dart';
import 'package:chapp/components/divider/divider.dart';
import 'package:chapp/components/swipeable/blueprint/simultaneity_definition.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
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

  static getTimelineDivider(String label) {
    return HorizontalDivider(
      labelAlignment: Alignment.center,
      label: label,
      labelMarginAmount: 12.0,
      labelTextStyle: ChappTheme.timelineDividerTextStyle,
      lineColor: Colors.grey[200],
      dividerMarginInsets: EdgeInsets.only(top: 16, bottom: 2),
    );
  }
}
