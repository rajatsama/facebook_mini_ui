import 'package:facebook/data/data.dart';
import 'package:facebook/models/models.dart';
import 'package:flutter/material.dart';
import 'widget.dart';

class Room extends StatelessWidget {
  final List<User> onlineUser;

  const Room({
    Key key,
    @required this.onlineUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _createRoom(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _createRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('create room'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3,
        color: Colors.blueAccent[100],
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.video_call,
            size: 35,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}
