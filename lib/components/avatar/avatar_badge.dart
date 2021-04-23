import 'package:chapp/components/avatar/blueprint/avatar_badge_model.dart';
import 'package:flutter/material.dart';

class AvatarBadge extends StatelessWidget {
  final AvatarBadgeModel model;

  const AvatarBadge({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: model.changeNotifier,
      builder: (context, avatarBadge, child) {
        return Container(
          height: avatarBadge.size,
          width: avatarBadge.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: avatarBadge.color ?? Colors.black,
            border: avatarBadge.borderSize == 0
                ? null
                : Border.all(
                    color: avatarBadge.borderColor,
                    width: avatarBadge.borderSize,
                  ),
          ),
        );
      },
    );
  }
}
