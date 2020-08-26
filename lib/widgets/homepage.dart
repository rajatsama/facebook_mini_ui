import 'package:facebook/data/data.dart';
import 'package:facebook/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 30,
                  letterSpacing: -1.2,
                  fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              CircleButton(
                icon: Icons.search,
                onPressed: () => print('search'),
              ),
              CircleButton(
                icon: Icons.message,
                onPressed: () => print('notifications'),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: PostCreator(
            currentUser: currentUser,
          )),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Room(
                onlineUser: onlineUsers,
              ),
            ),
          ),SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories:stories
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context,index){
              final Post post =posts[index];
              return PostContainer(post:post);
          },
            childCount: posts.length),
          )
        ],
      ),
    );
  }
}
