import 'package:chapp/global/common.dart';
import 'package:chapp/model/subject/subject.dart';
import 'package:flutter/material.dart';

class Group extends Subject {
  String name;
  Map<String, Color> _memberIdColorSet;

  Group({
    @required String id,
    @required this.name,
    @required List<String> memberIdList,
    String avatarUrl,
  }) : super(id: id, avatarUrl: avatarUrl) {
    _memberIdColorSet = {myPersonalId: Colors.black};
    memberIdList.forEach((memberId) => addMember(memberId));
  }

  void addMember(String memberId) {
    if (!_memberIdColorSet.containsKey(memberId)) {
      _memberIdColorSet[memberId] = _newColorRepresentative;
    }
  }

  bool isMember(String memberId) {
    return _memberIdColorSet.containsKey(memberId);
  }

  Color getMemberColorRepresentative(String memberId) {
    return isMember(memberId) ? _memberIdColorSet[memberId] : null;
  }

  Set<Color> _colorRepresentativeSet = {};

  Color get _newColorRepresentative {
    if (_colorRepresentativeSet.isEmpty) {
      _colorRepresentativeSet = new Set.from(Colors.primaries)
        ..addAll(Colors.accents);
      return _newColorRepresentative;
    } else {
      Color color = _colorRepresentativeSet.first;
      _colorRepresentativeSet.remove(color);
      return color;
    }
  }

  @override
  String get title => this.name;
}
