import 'package:flutter/material.dart';
import 'widget.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(
              imageUrl,
            ),
          ),
        ),
        isActive
            ? Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.online,
                border: Border.all(color: Colors.white, width: 2)),
          ),
        )
            : SizedBox.shrink()
      ],
    );
  }

}