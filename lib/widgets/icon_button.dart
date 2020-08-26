import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CircleButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[100],
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.black,
        iconSize: 30,
        onPressed: onPressed,
      ),
    );
  }
}
