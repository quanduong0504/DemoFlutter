import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/models/news.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:flutter/material.dart';

class WhatNewItem extends StatefulWidget {
  final News _news;
  final bool _isLastItem;


  WhatNewItem(this._news, this._isLastItem);

  @override
  State<StatefulWidget> createState() {
    return _WhatNewItemState();
  }
}

class _WhatNewItemState extends BaseState<WhatNewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: widget._isLastItem ? 10 : 0),
        width: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage(widget._news.image),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(widget._news.ownerUser.userName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white, fontFamily: Fonts.BalsamiqSans)),
            Padding(
                padding: EdgeInsets.only(bottom: 10, top: 3),
                child: Text(widget._news.description, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white, fontFamily: Fonts.BalsamiqSans))
            )
          ],
        ),
    );
  }
}
