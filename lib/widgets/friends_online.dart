
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/user.dart';
import 'package:flutter/material.dart';

class FriendOnline extends StatefulWidget {
  final User _user;
  final bool _isLastItem;

  FriendOnline(this._user, this._isLastItem);

  @override
  State<StatefulWidget> createState() {
    return _FriendOnlineState();
  }
}

class _FriendOnlineState extends BaseState<FriendOnline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: widget._isLastItem ? 10 : 0),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            child: ClipOval(
              child: Image(image: AssetImage(widget._user.avatar ?? ''), width: 60, height: 60, fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 46),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
                color: Colors.green
            ),
          )
        ],
      )
    );
  }
}
