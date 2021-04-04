import 'package:chapp/components/avatar/avatar_widget.dart';
import 'package:chapp/components/avatar/blueprint/avatar_badge.dart';
import 'package:chapp/components/avatar/blueprint/circle_avatar.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:chapp/helper/color.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ChatBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final Image avatarImage;
  final AvatarBadge avatarBadge;

  const ChatBar({
    Key key,
    this.height = 60.0,
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
              width: this.height / 2 + 6,
              height: this.height / 2 + 6,
              child: IconButton(
                icon: Icon(
                  Ionicons.arrow_back_outline,
                  color: Colors.black54,
                  size: 18,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            this.avatarImage != null
                ? AvatarWidget(
                    avatarShape:
                        CircleShapedAvatar(radius: this.height / 2 - 6),
                    // padding vertical = 6
                    avatarImage: this.avatarImage,
                    borderSize: 1,
                    borderColor: Colors.black,
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
                            fontSize: 13,
                            color: subtitleColor,
                          ),
                        )
                      : EmptyWidget(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 36.0,
              child: IconButton(
                icon: Icon(Ionicons.call),
                iconSize: 20,
                color: Colors.black54,
                onPressed: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 36.0,
              child: IconButton(
                icon: Icon(Ionicons.videocam),
                iconSize: 20,
                color: Colors.black54,
                onPressed: () {},
              ),
            ),
            PopupMenuButton(
              padding: EdgeInsets.all(0),
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
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.black12,
            ),
          ),
          color: ColorHelper.createMaterialColor(Color(0xFFFCFCFCFC)),
        ),
      ),
    );
  }

  Widget _titleTextWidget(String title) {
    Text textWidget = Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    );

    return ChappTheme.autoSizedConversationChatBarTitleText
        ? FittedBox(fit: BoxFit.fitWidth, child: textWidget)
        : textWidget;
  }

  @override
  Size get preferredSize => Size.fromHeight(this.height);
}
