import 'package:chapp/components/avatar/blueprint/avatar_badge_model.dart';
import 'package:chapp/components/avatar/blueprint/avatar_model.dart';
import 'package:chapp/components/avatar/blueprint/circle_avatar.dart';
import 'package:chapp/components/conversation/card/settings.dart';
import 'package:chapp/global/subject_list.dart';
import 'package:chapp/model/subject/group.dart';
import 'package:chapp/model/subject/person.dart';
import 'package:chapp/model/subject/subject.dart';
import 'package:chapp/model/theme/chapp_theme.dart';
import 'package:flutter/material.dart';

const String myPersonalId = 'icanseker';

class ChappCommon {
  static final Map<String, AvatarBadgeModel> _avatarBadgeModelMap = {};

  static final Map<String, AvatarModel> _avatarModelMap = {};

  static AvatarBadgeModel getAvatarBadgeModel(String subjectId) {
    if (_avatarBadgeModelMap.containsKey(subjectId))
      return _avatarBadgeModelMap[subjectId];
    else {
      Subject subject = subjectList[subjectId];

      if (subject is Group)
        return null;
      else {
        AvatarBadgeModel badgeModel = AvatarBadgeModel(
          position: ConversationCardSettings.avatarBadgePosition,
          color: Colors.red,
          size: ConversationCardSettings.avatarBadgeSize,
          borderColor: ConversationCardSettings.avatarBadgeBorderColor,
          borderSize: ConversationCardSettings.avatarBadgeBorderSize,
        );

        _avatarBadgeModelMap[subjectId] = badgeModel;
        return _avatarBadgeModelMap[subjectId];
      }
    }
  }

  static AvatarModel getAvatarModel(String subjectId) {
    if (subjectId == null) return null;
    if (_avatarModelMap.containsKey(subjectId))
      return _avatarModelMap[subjectId];
    else {
      Subject subject = subjectList[subjectId];
      Image image = subject.avatarUrl == null
          ? subject is Person
              ? ChappTheme.defaultPersonAvatar
              : ChappTheme.defaultGroupAvatar
          : Image.network(subject.avatarUrl);
      AvatarModel avatarModel = AvatarModel(
        shape: CircleShapedAvatar(size: ConversationCardSettings.avatarSize),
        image: image,
        borderSize: ConversationCardSettings.avatarBorderSize,
        borderColor: ConversationCardSettings.avatarBorderColor,
        badgeModel: getAvatarBadgeModel(subjectId),
        badgePosition: ConversationCardSettings.avatarBadgePosition,
      );

      _avatarModelMap[subjectId] = avatarModel;
      return _avatarModelMap[subjectId];
    }
  }
}
