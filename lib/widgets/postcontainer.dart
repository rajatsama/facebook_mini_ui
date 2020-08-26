import 'package:facebook/models/models.dart';
import 'package:flutter/material.dart';
import 'widget.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _PostHeader(post: post),
                SizedBox(
                  height: 4,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl,
                  ),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '${post.timeAgo} *',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: Icon(Icons.more_horiz), onPressed: () => print('more')),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            _PostButton(
              icon: Icon(Icons.thumb_up,color: Colors.grey,size: 20,),
              label: 'Like',
              onPressed: () => print('liked'),
            ),_PostButton(
              icon: Icon(Icons.message,color: Colors.grey,size: 20,),
              label: 'Comment',
              onPressed: () => print('Commented'),
            ),_PostButton(
              icon: Icon(Icons.share,color: Colors.grey,size: 25,),
              label: 'Share',
              onPressed: () => print('Shared'),
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onPressed;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon,
                  SizedBox(width: 4,),
                  Text(label)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
