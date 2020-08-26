
import 'package:facebook/models/models.dart';
import 'package:flutter/material.dart';
import 'widget.dart';

class PostCreator extends StatelessWidget {
  final User currentUser;

  const PostCreator({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ProfileAvatar(imageUrl:currentUser.imageUrl),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s in your mind'),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.videocam,color: Colors.red),
                label: Text('Live'),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.photo_library,color: Colors.green),
                label: Text('Photo'),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.video_call,
                  color: Colors.purpleAccent,),
                label: Text('Room'),
              )
            ],
          )
        ],
      ),
    );
  }
}
