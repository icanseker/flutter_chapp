import 'package:chapp/components/avatar/avatar_widget.dart';
import 'package:chapp/components/avatar/blueprint/avatar_badge.dart';
import 'package:chapp/components/avatar/blueprint/circle_avatar.dart';
import 'package:chapp/components/conversation/appbar/settings.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ChatBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final Image avatarImage;
  final AvatarBadge avatarBadge;

  const ChatBar({
    Key key,
    @required this.title,
    this.subtitle,
    this.subtitleColor,
    this.avatarImage,
    this.avatarBadge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: ChatBarSettings.backBtnContainerWidth,
              child: IconButton(
                icon: Icon(
                  Ionicons.arrow_back_outline,
                  color: ChatBarSettings.backBtnIconColor,
                  size: ChatBarSettings.backBtnIconSize,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            this.avatarImage != null
                ? AvatarWidget(
                    avatarShape: CircleShapedAvatar(
                      radius: ChatBarSettings.avatarRadius,
                    ),
                    avatarImage: this.avatarImage,
                    borderSize: ChatBarSettings.avatarBorderSize,
                    borderColor: ChatBarSettings.avatarBorderColor,
                    avatarBadge: this.avatarBadge,
                  )
                : EmptyWidget(),
            this.avatarImage != null ? SizedBox(width: 12) : EmptyWidget(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleTextWidget(this.title),
                  this.subtitle != null
                      ? Text(
                          this.subtitle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ChatBarSettings.subtitleFontSize,
                            color: subtitleColor,
                          ),
                        )
                      : EmptyWidget(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              width: ChatBarSettings.actionBtnContainerWidth,
              child: IconButton(
                icon: Icon(Ionicons.call),
                iconSize: ChatBarSettings.actionBtnIconSize,
                color: ChatBarSettings.actionBtnIconColor,
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              width: ChatBarSettings.actionBtnContainerWidth,
              child: IconButton(
                icon: Icon(Ionicons.videocam),
                iconSize: ChatBarSettings.actionBtnIconSize,
                color: ChatBarSettings.actionBtnIconColor,
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              width: ChatBarSettings.menuBtnContainerWidth,
              child: PopupMenuButton(
                iconSize: ChatBarSettings.menuBtnIconSize,
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Delete all messages'),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    value: "/empty-chat",
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Delete conversation'),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    value: "/delete-conversation",
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: ChatBarSettings.bottomBorderColor,
            ),
          ),
          color: ChatBarSettings.backgroundColor,
        ),
      ),
    );
  }

  Widget _titleTextWidget(String title) {
    Text textWidget = Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ChatBarSettings.titleFontSize,
      ),
    );

    return ChappTheme.autoSizedConversationChatBarTitleText
        ? FittedBox(fit: BoxFit.fitWidth, child: textWidget)
        : textWidget;
  }

  @override
  Size get preferredSize => Size.fromHeight(
        ChatBarSettings.height + 8,
      ); // vertical padding = 4
}
