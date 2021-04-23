import 'package:chapp/components/avatar/avatar_badge.dart';
import 'package:chapp/components/avatar/blueprint/avatar_model.dart';
import 'package:chapp/components/empty_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final AvatarModel model;

  const Avatar({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AvatarBadge avatarBadgeWidget = AvatarBadge(model: model.badgeModel);

    return GestureDetector(
      onTap: () {
        model.shape.change.size(model.shape.size * 1.2);
        model.badgeModel.change.size(model.badgeModel.size * 1.2);
        // model.badgeModel.change.color(Colors.black);
        // model.change.image(Image.asset('assets/images/unknown-icon.png'));
      },
      child: ValueListenableBuilder(
          valueListenable: model.changeNotifier,
          builder: (context, avatarBadge, child) {
            return Container(
              width: model.shape.size,
              height: model.shape.size,
              child: Stack(
                children: [
                  Padding(
                    padding: model.badgeContainerPaddingInsets,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(model.shape.topLeftBorderRadius),
                          topRight:
                              Radius.circular(model.shape.topRightBorderRadius),
                          bottomLeft: Radius.circular(
                              model.shape.bottomLeftBorderRadius),
                          bottomRight: Radius.circular(
                              model.shape.bottomRightBorderRadius),
                        ),
                        border: model.borderSize == 0
                            ? null
                            : Border.all(
                                color: model.borderColor,
                                width: model.borderSize,
                              ),
                        color: model.bgColor,
                        image: DecorationImage(
                          image: model.image.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  model.badgeModel == null
                      ? EmptyWidget()
                      : Padding(
                          padding: model.badgePaddingInsets,
                          child: Align(
                            alignment: model.badgePosition,
                            child: avatarBadgeWidget,
                          ),
                        ),
                ],
              ),
            );
          }),
    );
  }
}
